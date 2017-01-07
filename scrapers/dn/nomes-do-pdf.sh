#!/bin/bash

# TODO - read the PDF url from argument

# DN: Nomes 2016
wget http://www.dn.pt//DNMultimedia/DOCS+PDFS/nomes.pdf -o /dev/null -O nomes.pdf
pdftotext nomes.pdf -layout
# Let's normalize this into the "nome,numero,genero" syntax used for previous sources...
grep -v Página nomes.txt|grep -v Nomes|grep -v ^$|awk '{print $1",F,"$2}'|sed 's/\f//g'|grep -v ^,|grep -v ^$ >  ../../data/nomes-registados-2016.csv
grep -v Página nomes.txt|grep -v Nomes|grep -v ^$|sed 's/Gabriele,/Gabriele/g'|awk '{print $3",M,"$4}'|sed 's/\f//g'|grep -v ^,|grep -v ^$ >> ../../data/nomes-registados-2016.csv
