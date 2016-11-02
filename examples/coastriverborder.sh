#!/bin/bash
# Purpose:      create a map with political boundaries and rivers
# GMT modules:  pscoast
# Usage: ./coastriverborder.sh iceland -30 -10 60 70


filename=$1
west=$2
east=$3
south=$4
north=$5

echo $filename $west $east $south $north 

GMT pscoast -R$west/$east/$south/$north \
              -Jm.5c \
              -I1/1p,lightblue  -I2/0.25p,lightblue \
              -N1/.5p,-  \
              -Gwhite  \
              -Slightblue   > $filename.ps
              
ps2pdf -dEPSCrop $filename.ps 
pdf2svg $filename.pdf $filename.svg


