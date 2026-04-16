#!/bin/bash

  DIR=$1
INDEXDIR="/path/to/index"
SALMON="/path/to/salmon"

for file in $DIR/*_R1_*.fastq.gz
do
    sample=$(basename $file _R1_001_trimmed.fastq.gz)

    $SALMON quant \
      -i $INDEXDIR \
      -l A \
      -1 $DIR/${sample}_R1_001_trimmed.fastq.gz \
      -2 $DIR/${sample}_R2_001_trimmed.fastq.gz \
      -p 16 \
      --validateMappings \
      -o quants/${sample}
done
