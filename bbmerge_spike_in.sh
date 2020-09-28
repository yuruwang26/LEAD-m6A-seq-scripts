#!/bin/bash
#merge R1 and R2#
~/Tools/bbmap/bbmerge.sh in=CHe-YW-46S-12-03-R1_S13_R1_001.fastq in2=CHe-YW-46S-12-03-R1_S13_R2_001.fastq out=./Analysis/12-03_R1_merge.fastq outu=12-03-R1_unmerged.fq hist=hist2.t
~/Tools/bbmap/bbmerge.sh in=CHe-YW-46S-12-03-R2_S14_R1_001.fastq in2=CHe-YW-46S-12-03-R2_S14_R2_001.fastq out=./Analysis/12-03_R2_merge.fastq outu=12-03-R2_unmerged.fq hist=hist2.t
~/Tools/bbmap/bbmerge.sh in=CHe-YW-46S-12-03-R3_S15_R1_001.fastq in2=CHe-YW-46S-12-03-R3_S15_R2_001.fastq out=./Analysis/12-03_R3_merge.fastq outu=12-03-R3_unmerged.fq hist=hist2.t
~/Tools/bbmap/bbmerge.sh in=CHe-YW-46S-12-03-R4_S16_R1_001.fastq in2=CHe-YW-46S-12-03-R4_S16_R2_001.fastq out=./Analysis/12-03_R4_merge.fastq outu=12-03-R4_unmerged.fq hist=hist2.t
