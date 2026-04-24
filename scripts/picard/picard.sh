#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=32G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load StdEnv/2023
module load picard/3.1.0

SAMPLES=("SRR576933" "SRR576934" "SRR576938")

for ID in "${SAMPLES[@]}"; do
    java -jar $EBROOTPICARD/picard.jar MarkDuplicates \
          I=../../results/samtools/${ID}.sorted.bam \
          O=../../results/picard/${ID}.dedup.bam \
          M=../../results/picard/${ID}.metrics.txt \
          REMOVE_DUPLICATES=true
done