#!/bin/bash

mysamples="12-03_R1_merge 12-03_R2_merge 12-03_R3_merge 12-03_R4_merge"

for s in $mysamples

do 

samtools view -b $s.AAC-0.sam -o $s.AAC-0.bam
samtools sort $s.AAC-0.bam -o $s.AAC-0.sorted.bam
samtools index $s.AAC-0.sorted.bam $s.AAC-0.sorted.bai

samtools view -b $s.AAC-20.sam -o $s.AAC-20.bam
samtools sort $s.AAC-20.bam -o $s.AAC-20.sorted.bam
samtools index $s.AAC-20.sorted.bam $s.AAC-20.sorted.bai

samtools view -b $s.AAC-40.sam -o $s.AAC-40.bam
samtools sort $s.AAC-40.bam -o $s.AAC-40.sorted.bam
samtools index $s.AAC-40.sorted.bam $s.AAC-40.sorted.bai

samtools view -b $s.AAC-60.sam -o $s.AAC-60.bam
samtools sort $s.AAC-60.bam -o $s.AAC-60.sorted.bam
samtools index $s.AAC-60.sorted.bam $s.AAC-60.sorted.bai

samtools view -b $s.AAC-80.sam -o $s.AAC-80.bam
samtools sort $s.AAC-80.bam -o $s.AAC-80.sorted.bam
samtools index $s.AAC-80.sorted.bam $s.AAC-80.sorted.bai

samtools view -b $s.AAC-100.sam -o $s.AAC-100.bam
samtools sort $s.AAC-100.bam -o $s.AAC-100.sorted.bam
samtools index $s.AAC-100.sorted.bam $s.AAC-100.sorted.bai

samtools view -b $s.GAC-0.sam -o $s.GAC-0.bam
samtools sort $s.GAC-0.bam -o $s.GAC-0.sorted.bam
samtools index $s.GAC-0.sorted.bam $s.GAC-0.sorted.bai

samtools view -b $s.GAC-20.sam -o $s.GAC-20.bam
samtools sort $s.GAC-20.bam -o $s.GAC-20.sorted.bam
samtools index $s.GAC-20.sorted.bam $s.GAC-20.sorted.bai

samtools view -b $s.GAC-40.sam -o $s.GAC-40.bam
samtools sort $s.GAC-40.bam -o $s.GAC-40.sorted.bam
samtools index $s.GAC-40.sorted.bam $s.GAC-40.sorted.bai

samtools view -b $s.GAC-60.sam -o $s.GAC-60.bam
samtools sort $s.GAC-60.bam -o $s.GAC-60.sorted.bam
samtools index $s.GAC-60.sorted.bam $s.GAC-60.sorted.bai

samtools view -b $s.GAC-80.sam -o $s.GAC-80.bam
samtools sort $s.GAC-80.bam -o $s.GAC-80.sorted.bam
samtools index $s.GAC-80.sorted.bam $s.GAC-80.sorted.bai

samtools view -b $s.GAC-100.sam -o $s.GAC-100.bam
samtools sort $s.GAC-100.bam -o $s.GAC-100.sorted.bam
samtools index $s.GAC-100.sorted.bam $s.GAC-100.sorted.bai

done
