#!/bin/bash

timestamp=$(date +%s)

echo "$(timestamp): startted a thing"

# in order, comms are timestamp, low, high, length
python make.py $timestamp 65 85 3
cd out/$timestamp

lilypond score.ly
open score.pdf
open qlist.txt
