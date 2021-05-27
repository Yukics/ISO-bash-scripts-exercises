#/bin/bash

if ! [ $# -eq 2 ] #Comprobamos que le numero de parametros es correcto
then
	echo "Numero de parametros erroneo, se necesitan dos, un fichero con la ruta de un directorio y un nombre de archivo"
    exit 1
fi
if ! [ -d `echo $1` ] #Comprobamos que el primer fichero pasado por parametro existe
then
    echo "No has pasado un directorio valido o no es un fichero"
    exit 1
fi
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi


ls -la $1 > listadirs.txt

while read i; do #Leo cada linea del fichero anterior
    if [ `echo $1 | awk {'print $5'}` -ge $2]
        read -p "$i: (E)sborra / (M)anté / (C)omprimeix?" elect
        if [ "$elect" == 'E' ] #Si se introduce q se para
        then
            if rm -r $1
            then
                echo "$i: Esborrat" >> exercisi.log
            else
                echo "$i: Esborrat, fallada probablement permisos" >> exercisi.log
            fi
        
        elif [ "$elect" == 'M' ]
        then
            echo "$i: Mantingut" >> exercisi.log        
        elif [ "$elect" == 'C' ]
        then
            comandotar="tar -czf exercici.tar.gz"+" $i"
            echo "$i: Comprimit" >> exercisi.log  
        else
            echo "No has seleccionado una opción válida para este fichero"
        fi
    fi
done < listadirs.txt 
if [ $comandotar != '' ]
then
    bash -c $comandotar
fi
rm listadirs.txt