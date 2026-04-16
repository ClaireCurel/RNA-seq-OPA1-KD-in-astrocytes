#!/bin/bash

cd $PROJECT/fastqc

module use -s /s/mm/modules
module load python/v3

multiqc .
