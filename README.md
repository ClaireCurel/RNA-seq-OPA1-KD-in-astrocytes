## RNA-seq-OPA1-KD-in-astrocytes
# Differential gene expression analysis of astrocytes with and without OPA knockdown

This repository contains the code for RNA-seq data analysis of astrocyte with and wothout OPA1 knockdown including quality control, read processing, quantification and differential gene expression analysis. 

Analysis described in [paper link: Mitochondrial Optic Atrophy (OPA)1 expression regulates the injury response to neonatal hypoxia-ischaemia]

Processed data available via Zenodo [add link]

# Experimental summary:
- RNA quality measured using Nanodrop and Agilent Bioanalyzer
- Samples with the following criteria were selected for sequencing: RIN>6,A260/A280 = 1.8-2.2
- Libraries prepared using PolyA selection
- Sequencing performed on Illumina Novaseq
- ~20 million 2x150bp paired end reads per sample


# Analysis workflow
- Quality control using FastQC (v0.11.9)
- Adapter sequence trimming and quality filtering using Fastp (v0.23.4)
- Transcript mapping (against GRCm39 reference transcriptome) and quantification using Salmon (v1.10.0)
- Data import to RStudio and transcript-to-gene summarisation using txmieta pacakge in R
- Differential gene expression analysis using DSeq2
  - genes present in <2 samples and total of <10 counts filtered out
  - paired design controlling for litter effect
  - surrogate variable analysis (SVA) performed to remove unwanted sources of variation
  - significance threshold: adjusted p-value <0.1
- Downstream analysis: DAVID for KEGG and GO analysis, STRING to identify protein-protein interactions, ggplot2 & PCAtools wre used for data visualisation
