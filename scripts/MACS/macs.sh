#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/MACS/2.0.10.09132012

cd $SLURM_SUBMIT_DIR

# macs2 callpeak \
# -t ../../results/MACS/SRR576933.sorted.bam \
# -c ../../results/MACS/SRR576938.sorted.bam \
# -f BAM \
# -n "../../results/MACS/macs2" \
# -g 4639675 \
# --bw 400 \
# --keep-dup 1 \
# --nomodel \
# --bdg \
# --SPMR \
# &> ../../results/MACS/MACS.out

# experiment (FNR IP ChIP-seq Anaerobic A)
macs2 callpeak \
-t ../../results/picard/SRR576933.dedup.bam \
-c ../../results/picard/SRR576938.dedup.bam \
-f BAM \
-g 4639675 \
-n "../../results/MACS/anaerobic_FNR_RepA" \
--bw 400 \
--keep-dup 1 \
--bdg \
--nomodel \
--SPMR \
--call-summits \
&> ../../results/MACS/macs_RepA.out

# experiment (FNR IP ChIP-seq Anaerobic B)
macs2 callpeak \
-t ../../results/picard/SRR576934.dedup.bam \
-c ../../results/picard/SRR576938.dedup.bam \
-f BAM \
-g 4639675 \
-n "../../results/MACS/anaerobic_FNR_RepB" \
--bw 400 \
--keep-dup 1 \
--bdg \
--nomodel \
--SPMR \
--call-summits \
&> ../../results/MACS/macs_RepB.out