#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/bowtie

# Prepare the index file
bowtie-build ../../data/NC_000913.3.fasta ../../results/bowtie/NC_000913.3
