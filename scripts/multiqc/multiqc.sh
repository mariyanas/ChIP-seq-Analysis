#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/MultiQC/1.33

cd $SLURM_SUBMIT_DIR

multiqc--outdir ../../results/multiqc ../../results/fastqc/ --outdir ../../results/multiqc