#!/bin/bash
module load vcftools

#this script tells the ratio of missing snps per dataset in your vcf file
#to run this script do
#sh vcftools_missing_indv.sh <file> <number of datasets in vcf file in which at least that number has a snp [interger]>

file=$1
missingindv=$2
out=$(echo $file |sed 's/.vcf/_max_missing_indvsumm.vcf/g')
vcftools --vcf $file \
  --max-missing-count $missingindv \
  --missing-indv
  --recode \
  --recode-INFO-all \
  --out $out