#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/bowtie

# experiment (FNR IP ChIP-seq Anaerobic A)
bowtie ../../results/bowtie/NC_000913.3 -q ../../data/SRR576933.fastq.gz  -v 2 -m 1 -3 1 -S 2> ../../results/bowtie/SRR576933.out > ../../results/bowtie/SRR576933.sam

# experiment (FNR IP ChIP-seq Anaerobic B)
bowtie ../../results/bowtie/NC_000913.3 -q ../../data/SRR576934.fastq.gz  -v 2 -m 1 -3 1 -S 2> ../../results/bowtie/SRR576934.out > ../../results/bowtie/SRR576934.sam

# control
bowtie ../../results/bowtie/NC_000913.3 -q ../../data/SRR576938.fastq.gz  -v 2 -m 1 -3 1 -S 2> ../../results/bowtie/SRR576938.out > ../../results/bowtie/SRR576938.sam