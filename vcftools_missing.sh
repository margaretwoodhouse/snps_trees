#!/bin/bash
module load vcftools

#this script selects the lowest number of datasets in the vcf file where a snp should be present
#to run this script do
#sh vcftools_missing.sh <file> <max missing value [interger] i.e. the minimum number of datasets in the vcf file that should contain a SNP>
 
file=$1
maxmissing=$2
out=$(echo $file |sed 's/.vcf/_max_missing.vcf/g')
vcftools --vcf $file \
  --max-missing-count $maxmissing \
  --recode \
  --recode-INFO-all \
  --out $out