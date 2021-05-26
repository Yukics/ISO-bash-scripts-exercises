#/bin/bash

#1. Escriviu un shellscript que, a partir d’una ruta de directori indicada dins un fitxer (el nom
#del fitxer es passa per paràmetre $1) examini si existeix un fitxer anomenat el nom indicat
#pel paràmetre $2 a la ruta indicada pel fitxer $1. Si és així, ha de mostrar un missatge
#que indiqui que existeix. Si no és així, l’ha de crear a la ruta $1. Si no és possible crear el
#fitxer, ha de mostrar un missatge que indiqui que no s’ha pogut crear el fitxer.

#NOTA: el fitxer passat per paràmetre només conté la ruta del directori.

if ! [ $# -eq 2 ] #Comprobamos que le numero de parametros es correcto
then
	echo "Numero de parametros erroneo, se necesitan dos, un fichero con la ruta de un directorio y un nombre de archivo"
    exit
fi
if ! [ -f `echo $1` ] #Comprobamos que el primer fichero pasado por parametro existe
then
    echo "No has pasado un fichero valido o no es un fichero"
    exit 1
fi

if ! [ -d `cat $1` ] #Comprobamos que el contenido del fichero es efectivamente un directorio existente
then
    mkdir -p `cat $1` 2> log.txt #En caso de que no exista creamos la ruta y el archivo en ella
    if ! [ -s log.txt ]#Si el fichero log.txt esta vacio no ha habido errores
    then
        rm log.txt
        cd `cat $1`
        touch $2        
        exit 1
    else #Si contiene algo es que no se puede crear la ruta
        echo "No se ha podido crear la ruta"
        rm log.txt
        exit 1
    fi
else  
    cd `cat $1`
    if ! [ -e $2 ] #En caso de que exista vamos ala ruta y comprobamos que exista el fichero en caso de que no exista se crea
    then        
        touch $2
    else
        echo "Ya existe el fichero" #En caso de que exista muestra este mensaje
    fi
fi



