#!/bin/bash

DATE_NOW=$(date --rfc-3339='seconds')
DATE_EXP=$(date -d "+3 months" ${DATE_NOW})
mkdir -p ./paas_app/.well-known/
cp ./security.txt ./paas_app/security.txt
cp ./thanks.txt ./paas_app/thanks.txt
sed -i "s/DATE_NOW/${DATE_NOW}/g" ./paas_app/security.txt
sed -i "s/DATE_EXP/${DATE_EXP}/g" ./paas_app/security.txt
cp ./paas_app/security.txt ./paas_app/.well-known/security.txt

# DEBUG
cat ./paas_app/security.txt