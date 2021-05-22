#/bin/bash

if [ $# != 3 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi

if ! [[ -d "$2" ]] #Comprobamos que M es un directorio o fichero
then
    if ! [[ -f "$2" ]]
    then
        echo "$2 no es un directorio. Debes pasar cada cuanto lo revisamo, la ruta del directorio y el numero de links"
        exit
    fi
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto. Debes pasar cada cuanto lo revisamo, la ruta del directorio y el numero de links"
   exit
fi

re='^[0-9]+$'
if ! [[ $3 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto. Debes pasar cada cuanto lo revisamo, la ruta del directorio y el numero de links"
   exit
fi

while : #Entramos en bucle indefinido
do   
    sleep $1 #Cada N lo revisa
    #nlinks=`sudo find $2 -maxdepth 1 -type l | wc -l` #Contamos los links del directorio pasado
    nlinks=`stat -c %h $2`
    if [ $nlinks -ge $3 ] #En caso de que el directorio tenga mas links de los que queremos salta el mensaje
    then
        echo "Se ha excedido el numero de enlaces en $2: $nlinks de $3"
        exit 1
    fi
    echo "De momento no se ha excedido el parametro dado ni igualado." #Si no hay en
done