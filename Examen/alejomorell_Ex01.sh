#/bin/bash

re='[Aa-Zz]'

if ! [ "$#" -eq 3 ] #Comprobación de que el numero de parametros es correcto
then
    echo "No has introducido un numero de parametros validos"
    exit 1
fi
if ! [ -d $1 ] #Comprobación de que el primer parametro es un directorio
then
    echo "El primer parametro no es un directorio"
    exit 1
fi

count=0
for i in $1/* #Comienza un bucle que recorre todos los archivos que contiene el directorio
do

    if echo `basename $i` | grep -E "$2$" > /dev/null #Si el nombre de un fichero tiene la extensión y además comienza por el 3er parametro
    then
        if echo `basename $i` | grep -E "^$3" > /dev/null
        then
            if rm "$i" #Lo borra, y si no ha habido problema muestra un output
            then
                echo "`basename $i` eliminat"
                let count+=1
            else 
                echo "No se ha podido borrar"
            fi            
        fi         
    fi
done

echo "Total eliminats: $count"