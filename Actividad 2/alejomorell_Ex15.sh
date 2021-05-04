#!/bin/bash

#He dividido el script por partes para hacerlo mas entendible pero es posible reducirlo a un unico condicional
#user=`ps -o user= -p $$` #Primero sabemos que usuario ha ejecutado el script
#esSudo=`groups $user | grep -wc 'sudo'` #Luego contamos cuantas veces aparece la palabra sudo entre los grupos del usuario
#if [ $esSudo == 1 ]; then
#  echo "Sóc l'amo del món" #En caso de que aparezca una vez muestra el mensaje
#lse
#  sudo bash $0 #En caso de que no trata de ejecutarlo como sudo, pero si el usuario no esta en el grupo sudoers no le permitira utilizar sudo como comando
#fi


if [ "$EUID" == 0 ]; then #Cuando se ejecuta como superusuario el user id es 0 de root, cuando se da la condicion imprime esto
    echo "Sóc l'amo del món"
else
    sudo $0 #Cuando no, se ejecuta a si mismo
fi
