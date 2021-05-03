#!/bin/bash

touch tmp #Crea archivo tmp

for i in *.txt #Itera por cada archivo de txt de la carpeta en la que se encuentra
do
	grep “examen” $i >> tmp #Añade las lineas del archvio txt de la iteración que contienen la palabra examen
done

wc -l < tmp #Cuenta las lineas del archivo tmp
rm tmp #Borra el archivo tmp
