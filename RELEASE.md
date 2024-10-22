# Releases

### 0.1.0
* **shared-pipelines** (, 0.1.0)
* **alignment-pipelines** (, 0.1.0)
* **sentieon-pipelines** (, 0.1.0)
* **qc-pipelines** (, 0.1.0)
* **rnaseq-pipelines** (, 0.1.0)
* **smaht-pipeline-utils** (, 0.1.0)

#### **CHANGELOG**

**Illumina_alignment_GRCh38**
- **<sup><sub>+</sub></sup>Added** local indel realignment
- **<sup><sub>+</sub></sup>Added** support for DRAGEN read names with UMI information
- **<sup><sub>+</sub></sup>Added** VerifyBamID
- **<sup><sub>+</sub></sup>Added** mosdepth

**PacBio_alignment_GRCh38**
- **<sup><sub>+</sub></sup>Added** VerifyBamID
- **<sup><sub>+</sub></sup>Added** mosdepth

**ONT_alignment_GRCh38**
- **<sup><sub>+</sub></sup>Added** mosdepth

**Hi-C_alignment_GRCh38**
- **<sup><sub>+</sub></sup>Added** support for DRAGEN read names with UMI information

**Illumina_FASTQ_quality_metrics**
- **<sup><sub>+</sub></sup>Added** Kraken2

**short_reads_FASTQ_quality_metrics**
- **<sup><sub>+</sub></sup>Added** Kraken2

**long_reads_FASTQ_quality_metrics** <sup><sub>NEW</sub></sup>
- *Quality metrics for long-read raw data (FASTQ, uBAM)*

**cram_to_fastq_paired-end** <sup><sub>NEW</sub></sup>
- *CRAM to FASTQ conversion for short-read paired-end data*

**RNA-seq_bulk_short_reads_GRCh38** <sup><sub>NEW</sub></sup>
- *Alignment for short-read paired-end bulk RNA-seq data*
- *Quantification of transcript and gene abundances*
- *Quality metrics for short-read paired-end bulk RNA-seq aligned data (BAM)*

---

### 0.0.1

* **shared-pipelines** (44888f8, 0.0.1)
* **alignment-pipelines** (fa2ef75, 0.0.1)
* **sentieon-pipelines** (08c59ad, 0.0.1)
* **qc-pipelines** (94ddb5f, 0.0.1)
* **smaht-pipeline-utils** (af5cb1e, 0.0.1)

#### **CHANGELOG**

**Illumina_alignment_GRCh38** <sup><sub>NEW</sub></sup>
- *Removal of polyG artifacts for Illumina two-channel sequencing systems*
- *Alignment for short-read paired-end Illumina data*
- *Quality metrics for short-read paired-end aligned data (BAM)*

**PacBio_alignment_GRCh38** <sup><sub>NEW</sub></sup>
- *Alignment for long-read PacBio Hifi data*
- *Quality metrics for long-read aligned data (BAM)*

**ONT_alignment_GRCh38** <sup><sub>NEW</sub></sup>
- *Alignment for long-read Oxford Nanopore Technology data*
- *Quality metrics for long-read aligned data (BAM)*

**Hi-C_alignment_GRCh38** <sup><sub>NEW</sub></sup>
- *Alignment for short-read paired-end Illumina Hi-C data*
- *Quality metrics for short-read aligned data (BAM)*

**Illumina_FASTQ_quality_metrics** <sup><sub>NEW</sub></sup>
- *Quality metrics for short-read paired-end raw data (FASTQ). Includes a safety check against duplicate lanes based on Illumina read names*

**short_reads_FASTQ_quality_metrics** <sup><sub>NEW</sub></sup>
- *Quality metrics for short-read raw data (FASTQ)*

**bam_to_fastq_paired-end** <sup><sub>NEW</sub></sup>
- *BAM to FASTQ conversion for short-read paired-end data*