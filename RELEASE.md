# CHANGELOG

### 0.2.0

* **shared-pipelines** (5fb7cf4)
* **alignment-pipelines** (0329b80)
* **sentieon-pipelines** (72726af)
* **qc-pipelines** (3ac3df3)
* **rnaseq-pipelines** (c9ba0ad)
* **smaht-pipeline-utils** (f96e35f)

| Pipeline (*MetaWorkflow*)               | Repository        | Change/Feature                                  |
|-----------------------------------------|-------------------|-------------------------------------------------|
| **Illumina_alignment_GRCh38**           | main-pipelines    | *No change since 0.1.0*                         |
| **PacBio_alignment_GRCh38**             | main-pipelines    | *No change since 0.1.0*                         |
| **ONT_alignment_GRCh38**                | main-pipelines    | + Added VerifyBamID                         |
| **Hi-C_alignment_GRCh38**               | main-pipelines    | *No change since 0.1.0*                         |
| **RNA-seq_bulk_short_reads_GRCh38**     | main-pipelines    | + GENCODE release updated (*v45 -> v47*)<br>+ Added tissues classifier<br>+ Added VerifyBamID |
| **RNA-seq_kinnex_long_reads_GRCh38**    | main-pipelines    | *Pipeline released*                             |
| **Illumina_FASTQ_quality_metrics**      | qc-pipelines      | *No change since 0.1.0*                         |
| **short_reads_FASTQ_quality_metrics**   | qc-pipelines      | *No change since 0.1.0*                         |
| **long_reads_FASTQ_quality_metrics**    | qc-pipelines      | + NanoPlot version updated (*1.42.0 -> 1.44.1*)                    |
| **sample_identity_check**               | qc-pipelines      | *Pipeline released*                             |
| **cram_to_fastq_paired-end**            | shared-pipelines  | *No change since 0.1.0*                         |
| **bam_to_fastq_paired-end**             | shared-pipelines  | *No change since 0.0.1*                         |

---

### 0.1.0

* **shared-pipelines** (56a0242)
* **alignment-pipelines** (2d2e348)
* **sentieon-pipelines** (4ac686f)
* **qc-pipelines** (259ba8d)
* **rnaseq-pipelines** (a92c5d2)
* **smaht-pipeline-utils** (8b54a7d)

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
| **bam_to_fastq_paired-end**      | shared-pipelines | *No change since 0.0.1*                                             |

---

### 0.0.1

* **shared-pipelines** (44888f8)
* **alignment-pipelines** (fa2ef75)
* **sentieon-pipelines** (08c59ad)
* **qc-pipelines** (94ddb5f)
* **smaht-pipeline-utils** (af5cb1e)

| Pipeline (*MetaWorkflow*)        | Repository      | Change/Feature           |
|----------------------------------|-----------------|---------------------------|
| **Illumina_alignment_GRCh38**    | main-pipelines  | *Pipeline released*       |
| **PacBio_alignment_GRCh38**      | main-pipelines  | *Pipeline released*       |
| **ONT_alignment_GRCh38**         | main-pipelines  | *Pipeline released*       |
| **Hi-C_alignment_GRCh38**        | main-pipelines  | *Pipeline released*       |
| **Illumina_FASTQ_quality_metrics**| qc-pipelines    | *Pipeline released*       |
| **short_reads_FASTQ_quality_metrics**| qc-pipelines    | *Pipeline released*       |
| **bam_to_fastq_paired-end**      | shared-pipelines | *Pipeline released*       |
