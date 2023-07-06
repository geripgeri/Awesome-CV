#!/bin/bash

cd $1

for file in *_detailed.pdf; do
    mv "$file" "../$2/${file%_detailed.pdf}.pdf"
done
