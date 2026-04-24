#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load samtools

cd $SLURM_SUBMIT_DIR

# sam to bam

samtools view -b ../../results/bowtie/SRR576933.sam > ../../results/samtools/SRR576933.bam
samtools view -b ../../results/bowtie/SRR576934.sam > ../../results/samtools/SRR576934.bam
samtools view -b ../../results/bowtie/SRR576938.sam > ../../results/samtools/SRR576938.bam

samtools sort -o ../../results/samtools/SRR576933.sorted.bam ../../results/samtools/SRR576933.bam
samtools sort -o ../../results/samtools/SRR576934.sorted.bam ../../results/samtools/SRR576934.bam
samtools sort -o ../../results/samtools/SRR576938.sorted.bam ../../results/samtools/SRR576938.bam