#!/bin/bash

read -p "Dime la ruta absoluta del fichero> " ruta #Pedimnos la ruta
if ! [[ -f $ruta ]]; then #Comprobamos que la ruta es real
  echo "No has escito una ruta"
  exit 1
fi

read -p "Dime un paquete> " pkg #Pedimos el nombre del paquete
if ! dpkg -l $pkg 2> /dev/null; then
  echo "El paquete no esta instalado"
  exit 1
fi

tienequeverconelpaquete=`dpkg -L $pkg | grep $ruta` #Variable que tendra contenido si hay coincidencias

if [ -z "$tienequeverconelpaquete" ] #Si la variable de antes esta vacia dice que NO hay coincidencias y viceversa
then 
      echo "El fichero $ruta NO pertenece a $pkg"
else
      echo "El fichero $ruta pertenece a $pkg"
fi