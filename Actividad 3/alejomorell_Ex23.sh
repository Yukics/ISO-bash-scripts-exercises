#/bin/bash

if [ `id -u` -ne 0 ] #Comprobamos quien ejecuta el script
then 
    echo "Solo funciona como root, el root tiene EUID 0, tu `id -u`"
    exit
fi

re='^[0-9]$'
if ! [[ $1 =~ $re ]] ; then #Comprobamos que al menos en un numero
   echo "No has introducido un numero o has introducido un numero incorrecto"
else
    if [ $1 -le 6 ] || [ $1 -ge 1 ] #Si el argumento esta comprendido entre el 1 y el 6, los niveles de runlevel
    then
        init $1 #Aplica el runlevelas
    else
        echo "Este runlevel no existe"
    fi
fi


