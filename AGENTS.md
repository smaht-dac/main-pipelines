# AGENTS.md

Guidance for AI coding agents working in **main-pipelines**, the umbrella repository for SMaHT pipelines.

## What this repository is

`main-pipelines` is an **orchestration and deployment repo**, not a tool repo. It contains:

1. **Cross-repository MetaWorkflows** in `portal_objects/metaworkflows/` — end-to-end pipelines that wire together Workflows defined in the component submodules (alignment + QC + calling in one MetaWorkflow).
2. **Submodule pins** — the exact commit of each component repo that a given release deploys.
3. **Deployment entry points** — `Makefile`, `.env`, `scripts/check_awscred.sh`.
4. **The single source of truth for the release version** — `VERSION`.

Component tools (CWL `descriptions/`, `dockerfiles/`, individual `portal_objects/workflows/`) live in the **submodules**, not here. This repo has no `descriptions/` or `dockerfiles/` directory of its own; `docker/ubuntu-py/` holds shared base images only and is not part of the ECR deploy.

Docs live in a separate repo: https://smaht-dac.github.io/pipelines-docs/

## Layout

```
main-pipelines/
├── portal_objects/metaworkflows/   # the only deployable content in this repo
├── VERSION                         # drives the version of EVERY deployed object
├── PIPELINE                        # "main-pipelines" identifier
├── RELEASE.md                      # changelog — see conventions below
├── Makefile                        # deploy-base / deploy-all
├── .env                            # per-environment deploy config (WOLF / PROD)
├── scripts/check_awscred.sh        # interactive pre-deploy credential check
├── utils/check_metaworkflows_output.py  # prints output policies/tags for a MWF
├── docker/ubuntu-py/{py38,py39,py310}   # shared base images
└── <submodules>/                   # shared-, alignment-, sentieon-, qc-,
                                    # rnaseq-, calling-pipelines, smaht-pipeline-utils
```

Submodules (see `.gitmodules`): `shared-pipelines`, `alignment-pipelines`, `sentieon-pipelines`, `qc-pipelines`, `rnaseq-pipelines`, `calling-pipelines`, `smaht-pipeline-utils`.

## Rules that are easy to get wrong

**Workflow names in a MetaWorkflow resolve against the submodules.** A step key like `fastp_paired-end` or `ReplaceReadGroups` must match a `portal_objects/workflows/<name>.yaml` in one of the deployed repos. If a submodule renames a Workflow, every MetaWorkflow here that references it breaks at deploy time. Grep before and after bumping a submodule:

```bash
git diff <old>..<new> --stat -- portal_objects/   # inside the submodule
grep -rn "<renamed_workflow>" portal_objects/metaworkflows/
```

Watch for **name collisions across repos** — e.g. `ReplaceReadGroups` exists in both `shared-pipelines` and (folded into `ReplaceReadGroups_somalier_extract`) in `qc-pipelines`. Confirm which repo a name resolves to before assuming a submodule change affects this repo.

**`VERSION` overrides submodule versions.** `make deploy-*` passes `--version-file VERSION`, so the root version tags all Workflows, MetaWorkflows, ECR images, and the S3 WFL prefix (`s3://$WFL_BUCKET/<pipeline>/<version>/`) for *every* repo in the deploy. A submodule's own `VERSION` file is ignored during a main-pipelines deploy. Keep `VERSION` and `pyproject.toml`'s `version` in sync when bumping.

**Never bump `VERSION` unless the change is a release.** Ordinary submodule bumps and MetaWorkflow edits land in the already-open top section of `RELEASE.md` without a version change.

## RELEASE.md convention

The top section is the **open, unreleased version** — currently the same as `VERSION`. It has:

- A bullet list of submodules with commit hashes in parentheses. For the open section these are left **empty** (`* **qc-pipelines** ()`) and filled in for all repos at once at release time.
- A table row per MetaWorkflow: `| **<name>** | <repo> | <change> |`.

Change-cell vocabulary, used consistently:

| Cell | Meaning |
|---|---|
| `+ <description>` | changed in this version |
| `*No change since X.Y.Z*` | unchanged; the version it last changed in |
| `*Pipeline released*` | new in this version |

**Every PR that bumps a submodule or edits a MetaWorkflow updates the matching row(s)** in the open section — flip `*No change since ...*` to `+ <what changed>`. This is the step most easily forgotten.

## Common tasks

### Bump a submodule

```bash
cd <submodule> && git fetch && git checkout <commit> && cd ..
git diff <old>..<new> --stat            # review what actually changed
```

Then: check whether any renamed/removed Workflow is referenced from `portal_objects/metaworkflows/`, and update the affected `RELEASE.md` rows. Nothing else in this repo pins submodule contents — not `Makefile`, not `.env`, not `pyproject.toml`.

### Add or edit a MetaWorkflow

New MetaWorkflows go in `portal_objects/metaworkflows/` and are picked up automatically (the deploy globs the directory — no registry to update). Add a `*Pipeline released*` row to `RELEASE.md`.

Inspect output policies and tags before/after an edit:

```bash
poetry run python utils/check_metaworkflows_output.py portal_objects/metaworkflows/<name>.yaml
```

### Deploy

```bash
make configure && make pull && make build
make deploy-base    # shared-pipelines only
make deploy-all     # all submodules + this repo (".")
```

`.env` selects the target environment (WOLF vs. PROD blocks). `scripts/check_awscred.sh` prints the resolved settings and prompts for confirmation. Deployment is outward-facing and account-scoped — **do not run `make deploy-*` unless explicitly asked.**

## MetaWorkflow YAML conventions

Match the surrounding file exactly; these files are hand-formatted and consistency matters more than brevity.

- **Banner comments** delimit sections. Keep the `#####` widths and the `## Workflow definition ###` / `#   <name>` header above each step.
- **Multi-line `description`** uses trailing ` |` on each line, one clause per line.
- **Step wiring**: `source: <upstream step key>` + `source_argument_name: <upstream output name>`; `scatter: N` / `gather: N` / `input_dimension: N` for dimensionality.
- **Reference files** bind as `files: [<accession>@<version>]`, e.g. `dbsnp-all@138_GRCh38`. The referenced entry must exist in the owning submodule's `portal_objects/file_reference.yaml`.
- **Outputs** carry `description`, `data_category`, `data_type`, and optionally `s3_lifecycle_category: no_storage` for intermediates. Intermediate files that downstream steps consume but nobody keeps should be `no_storage`.
- **`config:` block** — every step has all six keys: `instance_type` (a list of interchangeable families), `ebs_size` (a multiplier string like `"3x"`, `'1.1x'`), `ebs_optimized`, `spot_instance`, `run_name: run_<step>`, `behavior_on_capacity_limit: wait_and_retry`. Steps that must not be interrupted (e.g. parse-qc) are moved off spot.
- **`qc_ruleset`** thresholds use the pipe syntax `Metric Name [Tool]|<op>|<threshold>|<tolerance>` with a `qc_rule` boolean expression over the threshold keys.

## Working style

- Changes here are almost always small: a submodule pointer, a `config:` block, a `RELEASE.md` row. Prefer the minimal diff; do not reformat surrounding YAML.
- `.env` contains environment/account settings — never echo its values into commit messages, PR bodies, or anything leaving the machine.
- Deploy commands, `git push`, and anything touching AWS are opt-in only.
