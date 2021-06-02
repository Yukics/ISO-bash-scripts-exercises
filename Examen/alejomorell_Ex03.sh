#/bin/bash
#Comenzamos un bucle infinito para la petición del fichero
while true; do
    read -p "Dime un nombre de fichero: " file #Pide el nombre y lo guarda en la variable file
    if [ -f $file ] #Se comprueba que existe file
    then
        break #Se sale dle bucle infinito
    fi
done

while read i; do #Mientras se lea el fichero linea a linea por la variable i

    uno=`echo $i | cut -d'|' -f1` #Separamos los dos numeros para su comparación con un cut
    dos=`echo $i | cut -d'|' -f2`

    if [ $uno -gt $dos ] #En caso de que se de una de las condiciones se define que numero es mayor o si son iguales
    then
        echo "$uno es mayor que $dos"
    elif [ $uno -lt $dos ]
    then
        echo "$dos es mayor que $uno"
    else
        echo "$uno y $dos son iguales"
    fi

done < $file #Le pasamos el fichero al bucle

eof=`cat $file | tail -1` #Hay un bug que si el fichero no acaba en nada, con linea vacía no lo recorre entero
if ! [ "$eof" == '' ]
then
    uno=`echo $eof | cut -d'|' -f1` #Separamos los dos numeros para su comparación con un cut
    dos=`echo $eof | cut -d'|' -f2`

    if [ $uno -gt $dos ] #En caso de que se de una de las condiciones se define que numero es mayor o si son iguales
    then
        echo "$uno es mayor que $dos"
    elif [ $uno -lt $dos ]
    then
        echo "$dos es mayor que $uno"
    else
        echo "$uno y $dos son iguales"
    fi
fi
