#!/bin/bash

mkdir -p out/_pgfcache
pdflatex -output-directory out -shell-escape example.tex
