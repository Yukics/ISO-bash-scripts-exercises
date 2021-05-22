#/bin/bash
if [ $# != 2 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto."
   exit
fi
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto."
   exit
fi

while : #Entramos en bucle indefinido
do   
    sleep $1 #Cada N lo revisa
    df | grep -E '((/dev/sd)|(/dev/nvme))' > dev.usage #Extraemos la info de los discos 
    cat dev.usage | sed 's/%//' | awk '{print $5}' | tee devper.usage

    while read i; do
        if [ $i -ge $2 ]
        then
            echo "`cat dev.usage | grep $i`"
        fi        
    done < devper.usage  
done
