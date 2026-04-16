#!/bin/bash

DIR=$1
OUTDIR=$PROJECT/fastp
mkdir -p $OUTDIR

FASTP="/path/to/fastp"
ADAPTER_FILE="../adapters/adapters.fa"

for file in $DIR/*_R1_*.fastq.gz
do
    sample=$(basename $file _R1_001.fastq.gz)

    $FASTP \
      -i $DIR/${sample}_R1_001.fastq.gz \
      -I $DIR/${sample}_R2_001.fastq.gz \
      -o $OUTDIR/${sample}_R1_trimmed.fastq.gz \
      -O $OUTDIR/${sample}_R2_trimmed.fastq.gz \
      -h $OUTDIR/${sample}.html \
      -j $OUTDIR/${sample}.json
done
