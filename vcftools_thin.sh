#!/bin/bash
module load vcftools

#this script subsamples based on selecting one snp per length in bp across genome
#to run this script do
#sh vcftools_thin.sh <file> <length in bp [interger] in which one snp should be selected>

file=$1
thinvalue=$2
out=$(echo $file |sed 's/.vcf/_thin.vcf/g')
vcftools --vcf $file \
  --thin $thinvalue \
  --recode \
  --recode-INFO-all \
  --out $out