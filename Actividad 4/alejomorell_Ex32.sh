#/bin/bash
if [ $# != 2 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi

#top | grep id, #Sacamos el porcentaje de idle de la cpu para calcular el total utilizado

touch ultimomincpuusage

while : #Entramos en bucle indefinido
do   
    sleep $1
    float=`grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}'` #Extraemos el porcentaje de utilización de la cpu sumamos los parametros menos el total y hacemos una regla de 3 para el porcentaje
    int=${float%,*} #Pasamos el numero con decimales anterior a enteros
        
    if [ `cat ultimomincpuusage | awk -v a=$2 '$1>a'` ] #Si encontramos dentro del fichero un numero superior al segundo parametro
    then
        echo    "Se ha sobrepasado el porcentaje de utilización, esta alrededor del $int %" #Nos notifica del uso y que se ha cumplido la condición
        break
    fi
    
    > ultimomincpuusage #Se borra el contenido del temporal
    echo $int > ultimomincpuusage
    	
done

rm ultimomincpuusage #Eliminamos el temporal

#El enunciado no deja muy claro a que se refiere con, en el último minuto del numero entero de la carga media. 
#Así que simplemente he comprobado la carga media cada vez que realizaba la comprobación ya que en cuanto ejecutamos 
#cualquier cosa queda en el pasado immediatamente y por lo tanto pasa a formar parte del ultimo minuto



