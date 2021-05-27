#/bin/bash

if ! [ $# -eq 2 ] #Comprobamos que le numero de parametros es correcto
then
	echo "Numero de parametros erroneo, se necesitan dos, un fichero con la ruta de un directorio tamaño de archivos"
    exit 1
fi
if ! [ -d `echo $1` ] #Comprobamos que el directorio existe
then
    echo "No has pasado un directorio valido o no es un fichero"
    exit 1
fi
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi


ls -l $1 | tail -n +2 > listadir.txt #Salida de lo que se encuentre en el primer nivel del directorio pasado por parametro en modo lista la cual iremos recorriendo en el bucle
> exercisi.log #Vaciamos el log

while read line; do #Leo cada linea del fichero anterior
    size=$((`echo $line | awk {'print $5'}`)) #Variable en la que se encuentra el valor en bytes del tamaño del fichero
    file="$1/`echo $line | awk {'print $9'}`" #La ruta del fichero que estamos manejando
    if [ $size -gt $2 ] #Si el fichero o directorio supera el tamaño especificado pregunta que hacer
    then
        read -p "$file: (E)sborra / (M)anté / (C)omprimeix: " elect </dev/tty #Necesario por comportamiento de read dentro de while registra automaticamente el stdin         

        if [ "$elect" == 'E' ] #Si se introduce E se elimina
        then
            if rm -r $file #Prueba a eliminarlo
            then
                echo "$file: Esborrat" >> exercisi.log 
            else
                echo "$file: Esborrat, fallada probablement permisos" >> exercisi.log #Si no lo consigue lo comenta en el log
            fi
        
        elif [ "$elect" == 'M' ] #Si se introduce M solo se informa en el log
        then
            echo "$file: Mantingut" >> exercisi.log        
        elif [ "$elect" == 'C' ] #Si se introduce C agrega el fichero al comando que se usa para comprimir
        then
            if [ "$comandotar" == '' ] #Creamos el comando tar necesario si no existe
            then
                comandotar="tar -czf exercici.tar.gz"
            fi

            comandotar+=" $file" #Añadimos el fichero a agregar al tar
            echo "$file: Comprimit" >> exercisi.log #Agrega al log
        else
            echo "No has seleccionado una opción válida para este fichero" #En caso de que no se decida una opción correcta se omite cualquier acción relacionada al fichero
        fi
    fi
done < listadir.txt 

if [ "$comandotar" != '' ] #En caso de que existan ficheros a comprimir
then
    $comandotar
fi

rm listadir.txt