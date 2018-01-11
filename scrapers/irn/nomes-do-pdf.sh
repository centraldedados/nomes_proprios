#!/bin/bash

# TODO - read the PDF url from argument
wget http://www.irn.mj.pt/sections/irn/a_registral/registos-centrais/docs-da-nacionalidade/vocabulos-admitidos-e/downloadFile/file/Lista_de_nomes_2017_11.pdf -o /dev/null -O nomes.pdf
pdftotext nomes.pdf -layout
cat nomes.txt |grep ^Femi|sed 's/Masculinos/\nM,/g'|sed 's/Femininos/F,/g' > resultado.txt 
