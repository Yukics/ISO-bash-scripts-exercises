#/bin/bash

#2. Escriviu un shellscript que:
#- Demana a l’usuari que indiqui una operació que pot ser: + - / % * q. L’usuari ha
#d’introduir el caràcter corresponent per teclat.
# - Si posa q, l’usuari està indicant que vol sortir. Per tant, el shellscript s’ha de despedir
#i acabar.
#- Si no ha posat cap d’aquestes opcions, s’ha d’indicar que no és correcte i tornar a
#demanar a l’usuari que indiqui una operació.
#- Si posa + - / % *, s’ha de realitzar l’operació corresponent amb els paràmetres $1 i
#$2, i donar un missatge amb la solució a l’usuari.
#- Després d’això tornarà a demanar que a demanar que l’usuari afegesqui una opció.
echo "Para salir del programa introduce una q como parametro"

if ! [ $# -eq 2 ] #Comprobamos que le numero de parametros es correcto
then
	echo "Numero de parametros erroneo, se necesitan dos, un fichero con la ruta de un directorio y un nombre de archivo"
    exit 1
fi
if ! [[ $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ ]] ; then #Comprobacion que los dos primeros argumentos son numericos
	echo "El argumento pasado no es numerico, o falta uno de los dos necesarios"
    exit 1
fi

while : #Bucle infinito
do
    
    echo "Introduce uno de estos signos para operar [+,-,*,/,%]: "
    read signo    
    
    if [ "$signo" == 'q' ] #Si se introduce q se para
    then
        echo "Adios hasta otra"
        exit 1
    fi

    if [ "$signo" == '+' ] || [ "$signo" == '-' ] || [ "$signo" == '*' ] || [ "$signo" == '/' ] || [ "$signo" == '%' ]
    then
        if [ "$signo" == '*' ]
        then
            let result=$1*$2 #Unica forma de que me funcione la multiplicación xD
        else
            let result=$1`echo $signo`$2 
        fi
        echo "El resultado de $1 $signo $2 es $result"      
    else
        echo "Introduce un signo por favor."
    fi
done
