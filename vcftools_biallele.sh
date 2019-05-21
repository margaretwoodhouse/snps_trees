#!/bin/bash
module load vcftools

#this script filters selects only bi-allelic snps and removes monomorphic snps
#to run this script do
#sh vcftools_biallele.sh <file> <MAF value>
#how to calculate MAF = 1/(n*2), so 1/(45*2)=0.011; n=number of datasets in your vcf file

file=$1
maf=$2

out=$(echo $file |sed 's/.vcf/non-monomorphic.vcf/g')
vcftools --vcf $file \
  --min-alleles 2 \
  --max-alleles 2 \
  --maf $maf \
  --recode \
  --recode-INFO-all \
  --out $out