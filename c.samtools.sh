#!/bin/bash

mysamples="CHe-YW-Nov25-19_S1_R2_001 CHe-YW-Nov25-19_S2_R2_001 CHe-YW-Nov25-19_S3_R2_001 CHe-YW-Nov25-19_S4_R2_001
CHe-YW-Nov25-19_S5_R2_001 CHe-YW-Nov25-19_S6_R2_001 CHe-YW-Nov25-19_S7_R2_001 CHe-YW-Nov25-19_S8_R2_001 CHe-YW-Nov25-19_S9_R2_001
CHe-YW-Nov25-19_S10_R2_001 CHe-YW-Nov25-19_S11_R2_001 CHe-YW-Nov25-19_S12_R2_001 CHe-YW-Nov25-19_S13_R2_001
CHe-YW-Nov25-19_S14_R2_001 CHe-YW-Nov25-19_S15_R2_001 CHe-YW-Nov25-19_S16_R2_001 CHe-YW-Nov25-19_S17_R2_001"

for s in $mysamples
do

samtools view -b $s.sam -o $s.bam
samtools sort $s.bam -o $s.sorted.bam
samtools index $s.sorted.bam $s.sorted.bai

done
