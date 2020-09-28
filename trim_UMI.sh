#!/bin/bash

mysamples="12-03_R1_merge 12-03_R2_merge 12-03_R3_merge 12-03_R4_merge"

for s in $mysamples

do 

cutadapt -u -15 -o ./trim_UMI/$s.dedupe.trim.fastq $s.dedupe.fastq

done
