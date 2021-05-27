#/bin/bash

if ! [ $# -eq 4 ] #Comprobamos que le numero de parametros es correcto
then
	echo "Numero de parametros erroneo, se necesitan dos, un fichero con la ruta de un directorio tamaño de archivos"
    exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi
if ! [[ $2 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi
if ! [[ $3 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi

while true; do

    ls -l | grep -E "^-.......w." | tail -n +1 > listaficheros.txt #Extraigo solo los ficheros con permiso de escritura para todos
    tamanoplus=0 #Inicializo variable de tamaño para comparar metodo burbuja

        while read line; do #Hace una suma del total de los ficheros modificables por todos
            sumar=`echo $line | awk {'print $5'}`
            let result+=$sumar
            if [ "$sumar" -gt "$tamanoplus" ] #Se queda con el mayor tamaño para luego hacer un grep de el 
            then
                tamanoplus=$sumar
            fi
        done < listaficheros.txt

        ntotalf=$((`wc -l listaficheros.txt | awk {'print $1'}`))

        if [ "$result" -gt "$3" ] && [ "$ntotalf" -gt "$2" ] 2>/dev/null #Si la suma del tamaño de los ficheros supera el limite y existen mas del numero de ficheros especificados
        then
            if cat listaficheros.txt | grep $tamanoplus | head -n 1 > `echo $4` #Agrega a la ubicación del cuarto parametro la información del fichero a eliminar
            then
                echo "Info fichero en $4"
            else
                echo "No ha sido posible mandar info del archivo a $4" #Si no es posible sale el error
            fi
            if rm `cat listaficheros.txt | grep $tamanoplus | awk {'print $9'}` #Intenta eliminar el fichero
            then
                echo "`cat listaficheros.txt | grep $tamanoplus | awk {'print $9'}` eliminado"
                rm listaficheros.txt
            else
                echo "No ha sido posible eliminar el fichero" #Si no es posible sale el error
            fi
        else
            echo "Si se ve un error sucede porque no hay ficheros disponibles que puedan ser modificados por todos, por lo que el condicional compara un numero con la nada"
            rm listaficheros.txt
        fi
    sleep $1 #Tiempo de espera en segundos
done