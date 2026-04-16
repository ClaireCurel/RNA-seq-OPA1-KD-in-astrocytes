#!/bin/bash

# summarise all FastQC outputs into one report
cd $PROJECT/fastqc

module use -s /s/mm/modules
module load python/v3

multiqc .
