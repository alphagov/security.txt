#!/bin/bash

# Build security.txt app

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    DATE_NOW=$(date --rfc-3339='seconds')
    DATE_EXP=$(date -d "+3 months" --rfc-3339='seconds')

    sed -i "s/DATE_NOW/${DATE_NOW}/g" ./security.txt
    sed -i "s/DATE_EXP/${DATE_EXP}/g" ./security.txt

    mkdir -p ./paas_app/.well-known/
    cp ./security.txt ./paas_app/security.txt
    cp ./thanks.txt ./paas_app/thanks.txt
    cp ./paas_app/security.txt ./paas_app/.well-known/security.txt
else
    echo "Due to different output format in date, only Linux is supported"
    exit 1
fi