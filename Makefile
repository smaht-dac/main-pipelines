include .env
export

.PHONY: build

configure:
	pip install --upgrade pip
	pip install poetry

pull:
	git submodule init
	git submodule update

update:
	poetry update

build:
	poetry install

deploy-base:
	scripts/check_awscred.sh
	poetry run smaht_pipeline_utils pipeline_deploy \
		--ff-env ${ENV_NAME} \
		--keydicts-json ${KEYDICTS_JSON} \
		--wfl-bucket ${WFL_BUCKET} \
		--account ${AWS_ACCOUNT_NUMBER} \
		--region ${AWS_DEFAULT_REGION} \
		--sentieon-server ${SENTIEON_LICENSE} \
		--post-software \
		--post-file-format \
		--post-file-reference \
		--post-workflow \
		--post-metaworkflow \
		--post-wfl \
		--post-ecr \
		--repos \
			shared-pipelines

deploy-all:
	scripts/check_awscred.sh
	poetry run smaht_pipeline_utils pipeline_deploy \
		--ff-env ${ENV_NAME} \
		--keydicts-json ${KEYDICTS_JSON} \
		--wfl-bucket ${WFL_BUCKET} \
		--account ${AWS_ACCOUNT_NUMBER} \
		--region ${AWS_DEFAULT_REGION} \
		--sentieon-server ${SENTIEON_LICENSE} \
		--post-software \
		--post-file-format \
		--post-file-reference \
		--post-workflow \
		--post-metaworkflow \
		--post-wfl \
		--post-ecr \
		--repos \
			shared-pipelines \
			sentieon-pipelines \
			alignment-pipelines \
			qc-pipelines \
			.

info:
	@: $(info Here are some 'make' options:)
	   $(info - Use 'make configure' to configure the repo by installing poetry.)
	   $(info - Use 'make pull' to initialize/pull the submodules.)
	   $(info - Use 'make update' to update dependencies and the lock file.)
	   $(info - Use 'make build' to install entry point commands.)
		 $(info - Use 'make deploy-base' to deploy shared pipeline components.)
	   $(info - Use 'make deploy-all' to deploy all the available pipeline components.)
