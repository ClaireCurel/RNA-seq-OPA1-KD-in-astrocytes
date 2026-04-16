#!/bin/bash

# Run FastQC on all FASTQ files in a directory
INPUT_DIR=$1
OUTDIR=$PROJECT/fastqc
mkdir -p $OUTDIR

module load fastqc/v0.11.9

for fastq_file in $INPUT_DIR/*.fastq.gz
do
    fastqc $fastq_file -o $OUTDIR
done
