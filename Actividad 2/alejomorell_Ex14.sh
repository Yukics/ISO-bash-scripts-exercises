#!/bin/bash

if [ $# -gt 1 ]; then #Comprueba que solo se ha pasado un argumento
    echo "Has pasado más de un argumento, solo quiero uno"
fi

if test -d $1; then #Si existe el directorio accede a el
    cd $1
else
    if mkdir -p $1 2> /dev/null ; then #Si la orden de crear el directorio funciona accede a el 
        cd $1
    else
        echo "No s'ha pogut crear el directori" #Si no muestra este mensaje y envia el error a dev null
    fi
fi
pwd