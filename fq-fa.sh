#!/bin/bash/
#Taking note, haven't learn how to create a *.sh programm.

echo "Please enter the path to the FASTQ file:"
read FILE

echo "Name of the FASTA file:"
read NAME

echo "Which are the 3 to 6 first characters in the header of your sequences in the FASTQ file?:"
read HEADER

#FILE=$1 #input -> fastq file
#NAME=$2 #name the output fasta file
#HEADER=$3

grep -A 1 "^$HEADER" $FILE | grep -v "\-\-" | sed -E 's/($HEADER)/>\1/' | sed 's/ /_/' > $NAME

SEQS=`grep -c "^>" $NAME

echo "Successfully converted $SEQS sequencces into a FASTA file"
