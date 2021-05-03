#!/bin/bash

for i in `sort $1`
do
     if grep $2 $i > /dev/null
     then
          echo A
          cp $i /tmp
          exit
     fi
done

echo B

#Se crea un bucle para iterar sobre una ordenación de la variable $1, en 
#caso de que alguna de esas iteraciones contenga lo que pasemos por $2, 
#enviará la respuesta de grep a /dev/null, hará un echo A y copiará el elemento 
#iterado a /tmp, por último muestra por pantalla B.
