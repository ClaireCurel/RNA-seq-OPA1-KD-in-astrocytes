#!/bin/bash

INPUTDIR=$1
cd $INPUTDIR

# Load samtools (cluster-specific, adjust if needed)
module load samtools

for sam_file in *.sam
do
    bam_file="${sam_file%.sam}.bam"
    sorted="${sam_file%.sam}_sorted.bam"

    samtools view -b -o "$bam_file" "$sam_file"
    samtools sort "$bam_file" -o "$sorted"
    samtools index "$sorted"
done
