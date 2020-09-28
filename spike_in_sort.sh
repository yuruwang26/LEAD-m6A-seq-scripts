#!/bin/bash

mysamples="12-03_R1_merge 12-03_R2_merge 12-03_R3_merge 12-03_R4_merge"

for s in $mysamples

do 

grep -A 2 -B 1 "AGGACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.0.fastq
grep -A 2 -B 1 "TAAACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.20.fastq
grep -A 2 -B 1 "CATACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.40.fastq
grep -A 2 -B 1 "GACACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.60.fastq
grep -A 2 -B 1 "AAGACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.80.fastq
grep -A 2 -B 1 "TTAACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.GAC.100.fastq
grep -A 2 -B 1 "CTTACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.0.fastq
grep -A 2 -B 1 "GTCACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.20.fastq
grep -A 2 -B 1 "ATGACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.40.fastq 
grep -A 2 -B 1 "TCAACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.60.fastq 
grep -A 2 -B 1 "ACTACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.80.fastq 
grep -A 2 -B 1 "GCCACAAGCCCCAAAAGC" $s.dedupe.trim.fastq | sed "/^--$/d" > ./sorted-spike-in/$s.AAC.100.fastq

done
