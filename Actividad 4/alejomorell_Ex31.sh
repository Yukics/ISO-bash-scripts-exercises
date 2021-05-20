#/bin/bash
if [ $# != 1 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos es un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
   exit
fi
df | grep -E '((/dev/sd)|(/dev/nvme))' | sed 's/|/ /' | awk '{print $1}' > devices.mounted #Extraemos los dispositivos de almacenamiento
echo "Presiona [CTRL+C] para detener"
while : #Entramos en bucle indefinido
do
    
    df | grep -E '((/dev/sd)|(/dev/nvme))' | sed 's/|/ /' | awk '{print $1}' > newdevices.mounted #Igual que antes, pero con otro fichero
    str=`diff newdevices.mounted devices.mounted | grep '<'`
    str=`echo ${str:2:${#str}}`
    #Comparamos si hay alguna diferencia entre los ficheros y agregamos la diferencia a str
    if [ "$str" != '' ] #En caso de que se encuentre una diferencia se imprime el resultado 
    then
        echo "Algo ha sido montado"
        echo `df | grep $str`
        ls `df | grep $str | awk '{print $6}'`
        break
    fi
    sleep $1	
done

#Cuando se acaba el script se borran los archivos temporales
rm devices.mounted
rm newdevices.mounted