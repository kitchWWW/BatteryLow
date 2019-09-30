#!/bin/bash
# in order, comms are timestamp, low, high, length
python make.py $1 $2 $3 $4
cd out/$1

lilypond score.ly
open score.pdf

