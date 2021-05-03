#!/bin/bash

touch tmp

for i in *.txt
do
	grep “examen” $i >> tmp
done

wc -l < tmp
rm tmp
