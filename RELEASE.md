# CHANGELOG

### 0.1.0
* **shared-pipelines** (, 0.1.0)
* **alignment-pipelines** (, 0.1.0)
* **sentieon-pipelines** (, 0.1.0)
* **qc-pipelines** (, 0.1.0)
* **rnaseq-pipelines** (, 0.1.0)
* **smaht-pipeline-utils** (, 0.1.0)

| Pipeline (*MetaWorkflow*)        | Repository      | Change/Feature                                             |
|----------------------------------|-----------------|-----------------------------------------------------------|
| **Illumina_alignment_GRCh38**    | main-pipelines  | + Added local indel realignment<br>+ Added support for DRAGEN read names with UMI information<br>+ Added VerifyBamID<br>+ Added mosdepth |
| **PacBio_alignment_GRCh38**      | main-pipelines  | + Added VerifyBamID<br>+ Added mosdepth                   |
| **ONT_alignment_GRCh38**         | main-pipelines  | + Added mosdepth                                           |
| **Hi-C_alignment_GRCh38**        | main-pipelines  | + Added support for DRAGEN read names with UMI information<br>+ Added mosdepth  |
| **RNA-seq_bulk_short_reads_GRCh38**| main-pipelines  | *Pipeline released*                                       |
| **Illumina_FASTQ_quality_metrics**| qc-pipelines    | + Added Kraken2                                           |
| **short_reads_FASTQ_quality_metrics**| qc-pipelines    | + Added Kraken2                                           |
| **long_reads_FASTQ_quality_metrics**| qc-pipelines    | *Pipeline released*                                       |
| **cram_to_fastq_paired-end**     | shared-pipelines | *Pipeline released*                                       |
| **bam_to_fastq_paired-end**      | shared-pipelines | *No changes (last changed in 0.0.1)*                                             |

---

### 0.0.1

* **shared-pipelines** (44888f8, 0.0.1)
* **alignment-pipelines** (fa2ef75, 0.0.1)
* **sentieon-pipelines** (08c59ad, 0.0.1)
* **qc-pipelines** (94ddb5f, 0.0.1)
* **smaht-pipeline-utils** (af5cb1e, 0.0.1)

| Pipeline (*MetaWorkflow*)        | Repository      | Change/Feature           |
|----------------------------------|-----------------|---------------------------|
| **Illumina_alignment_GRCh38**    | main-pipelines  | *Pipeline released*       |
| **PacBio_alignment_GRCh38**      | main-pipelines  | *Pipeline released*       |
| **ONT_alignment_GRCh38**         | main-pipelines  | *Pipeline released*       |
| **Hi-C_alignment_GRCh38**        | main-pipelines  | *Pipeline released*       |
| **Illumina_FASTQ_quality_metrics**| qc-pipelines    | *Pipeline released*       |
| **short_reads_FASTQ_quality_metrics**| qc-pipelines    | *Pipeline released*       |
| **bam_to_fastq_paired-end**      | shared-pipelines | *Pipeline released*       |
