#/bin/bash

if [ $# != 2 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi

if ! `test -d $1`   #Comprobamos que el primer parametro sea un directorio
then
    echo "El primer parametro no es un directorio"
    exit
fi

for file in $1/* #Iteramos en los ficheros del directorio
do
    if [ -f "$file" ] #En caso de ser un fichero regular aplicaremos lo siguiente
    then
        echo "Para `basename $file` se repite la palabra `cat $file | grep -c $2` veces" #Mostramos el nombre del fichero y la cantidad de veces que se repite en ese fichero el segundo argumento
    fi
done

#No funcionara correctamente si el nombre contiene espacios sin el find
#https://unix.stackexchange.com/questions/9496/looping-through-files-with-spaces-in-the-names