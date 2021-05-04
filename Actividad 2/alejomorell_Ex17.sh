#!/bin/bash

if ! [[ -f $1 ]]; then #Comprueba que es un fichero
    echo "El primer argumento no es un fichero"
    exit 1
fi

re='^[0-9]+$' #Define una expresión regular numérica
if ! [[ $2 =~ $re ]]; then #Comprueba que es un numero
    echo "El segundo argumento no es un numero"
fi

lineasfile=`wc -l $1 | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//'` #Primero extraigo el numero de lineas de un documento
((lineasporparte = ($lineasfile + $2 - 1) / $2)) #Calculo cuantas lineas por documento debe haber para dividir entre n ficheros

split -l $lineasporparte $1 #Divide el archivo en $2 partes