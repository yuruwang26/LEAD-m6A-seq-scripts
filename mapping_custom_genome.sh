#!/bin/bash

mysamples="12-03_R1_merge 12-03_R2_merge 12-03_R3_merge 12-03_R4_merge"

for s in $mysamples

do 

bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-0 -U $s.AAC.0.fastq -S ./sam_files/$s.AAC-0.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-20 -U $s.AAC.20.fastq -S ./sam_files/$s.AAC-20.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-40 -U $s.AAC.20.fastq -S ./sam_files/$s.AAC-40.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-60 -U $s.AAC.60.fastq -S ./sam_files/$s.AAC-60.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-80 -U $s.AAC.80.fastq -S ./sam_files/$s.AAC-80.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-AAC-100 -U $s.AAC.100.fastq -S ./sam_files/$s.AAC-100.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-0 -U $s.GAC.0.fastq -S ./sam_files/$s.GAC-0.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-20 -U $s.GAC.20.fastq -S ./sam_files/$s.GAC-20.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-40 -U $s.GAC.40.fastq -S ./sam_files/$s.GAC-40.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-60 -U $s.GAC.60.fastq -S ./sam_files/$s.GAC-60.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-80 -U $s.GAC.80.fastq -S ./sam_files/$s.GAC-80.sam
bowtie2 -p 8 -x ~/spike-in-genome/spike-in-GAC-100 -U $s.GAC.100.fastq -S ./sam_files/$s.GAC-100.sam


done
