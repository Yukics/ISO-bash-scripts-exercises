#!/bin/bash

re='^[a-z]+$' #Expresion regular para revisar que solo haya minusculas

for i in $@; do #Interaciones de todos los argumentos pasados
    if ! [[ $i =~ $re ]] ; then #En caso de que el argumento iterado no sea por completo en minusculas
        echo "$i no esta en minusculas o contiene numeros" #Muestra este mensaje
    else
        inicial=$(echo $i | head -c 1) #Si no agrega el elemento a un fichero llamado por la inicial de la palabra
        echo "$i" >> $inicial
    fi    
done

