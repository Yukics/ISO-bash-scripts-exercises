#/bin/bash

#Comprueba que este fichero existe
if `test -d /` 
	then echo "existe"
fi


#Comprueba que  la variable a cumpla una condición
a=5

if `test $a -lt 1 -a 3 -ne 1`
then
	echo "$a es menor que 1"
else 
	echo "$a es mayor que 1"
fi
