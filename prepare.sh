#!/bin/bash

if [[ -z "${EMAIL}" ]]; then
    echo "Missing environment variable: EMAIL"
    exit 1
fi

for filename in "$@"; do
    output=${filename%.*}_detailed.tex

    sed "s/EMAIL/${EMAIL}/" ${filename} > ${output}

    if [[ -z "${PHONE_NUMBER}" ]]; then
        sed -i '/PHONENUMBER/d' ${output}
        echo "PHONE_NUMBER environment variables are missing."
    else
        sed -i "s/PHONENUMBER/${PHONE_NUMBER}/" ${output}
    fi
done
