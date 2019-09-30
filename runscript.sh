#!/bin/bash
rm out.ly
rm out.pdf

python make.py

lilypond out.ly

open out.pdf