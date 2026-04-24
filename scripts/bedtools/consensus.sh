#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/bedtools

bedtools intersect \
-a ../../results/MACS/anaerobic_FNR_RepA_peaks.bed \
-b ../../results/MACS/anaerobic_FNR_RepB_peaks.bed \
> ../../results/bedtools/consensus.bed