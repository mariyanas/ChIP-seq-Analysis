#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/bedtools

bedtools getfasta -fi ../../data/NC_000913.3.fasta -bed ../../results/bedtools/consensus.bed -fo ../../results/bedtools/consensus.fa