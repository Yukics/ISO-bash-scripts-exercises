#/bin/bash
sudo df | grep -E '((/dev/sd)|(/dev/nvme))' > devices.mounted #Extraemos los dispositivos de almacenamiento
echo "Presiona [CTRL+C] para detener"
while : #Entramos en bucle indefinido
do
    sleep $1
    sudo df | grep -E '((/dev/sd)|(/dev/nvme))' > newdevices.mounted #Igual que antes
    diff newdevices.mounted devices.mounted | grep + > newtrue.mounted #Comparamos si hay alguna diferencia entre los ficheros
    if [ -s "newtrue.mounted" ] #En caso de que se encuentre una diferencia se imprime el resultado 
    then
        echo "Algo ha sido montado `echo newtrue.mounted`"
        exit 1
    fi
    echo newdevices.mounted > devices.mounted #En caso de que no hayan habido cambios se reemplaza el contenido de devices.mounted por el que era nuevo y ya no lo es	
done