#!/bin/bash

# TODO - read the PDF url from argument
wget http://static.publico.pt/DOCS/Sociedade/Nomes%202015.pdf -o /dev/null -O nomes.pdf
pdftotext nomes.pdf
for n in $(cat nomes.txt|grep '[^0-9]'|sed 's/^L//g'|sed 's/\ //g'|grep -v ^M$|grep -v ^F$|grep -v ^$); do echo ${n^}; done|sort -u > resultado.txt
