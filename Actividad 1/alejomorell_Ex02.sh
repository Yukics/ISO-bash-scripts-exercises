#!/bin/bash

comanda=ls #Asigna a una variable el comando ls

echo “$comanda” #Se muestra ls como tal
echo `$comanda` #Se ejecuta primero el ls y despues se muestra el contenido 
echo ‘$comanda’ #Hace lo mismo que las comillas dobles
