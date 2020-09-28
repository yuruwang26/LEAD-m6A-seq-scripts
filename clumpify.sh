#!/bin/bash
mysamples="12-03_R1_merge 12-03_R2_merge 12-03_R3_merge 12-03_R4_merge"

for s in $mysamples

do 

~/Tools/bbmap/clumpify.sh in=$s.fastq out=./dedupe/$s.dedupe.fastq dedupe >> duplicates_removal_1.log

done
