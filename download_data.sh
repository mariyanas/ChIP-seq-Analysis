#!/bin/bash 

# create directories
mkdir data
mkdir scripts
mkdir results

for d in results scripts; do
  mkdir -p "$d"/{fastqc,multiqc,bowtie,MACS,bedtools,samtools,picard}
done

cd data/

# experiment (FNR IP ChIP-seq Anaerobic A)
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR576/SRR576933/SRR576933.fastq.gz

# experiment (FNR IP ChIP-seq Anaerobic B)
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR576/SRR576934/SRR576934.fastq.gz

# control (anaerobic INPUT DNA)
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR576/SRR576938/SRR576938.fastq.gz

# Escherichia coli str. K-12 substr. MG1655, complete genome (NC_000913.2)
curl -L "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_000913.2&rettype=fasta&retmode=text" -o NC_000913.2.fasta

# Escherichia coli str. K-12 substr. MG1655, complete genome (NC_000913.3)
curl -L "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_000913.3&rettype=fasta&retmode=text" -o NC_000913.3.fasta