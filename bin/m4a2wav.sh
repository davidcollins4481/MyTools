#!/bin/bash

#TODO input! Just committing to remember how o do it
for f in *.m4a; do 
    ffmpeg -i "$f" "${f/%m4a/wav}"
done
