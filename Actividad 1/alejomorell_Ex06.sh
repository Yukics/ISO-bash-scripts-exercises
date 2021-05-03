#/bin/bash

for var in "$@"; do #Con $@ iteramos sobre la lista de todos los argumentos pasados
	re="^[A-Z]" #Define una expresión regular, la primera letra debe ser mayuscula. Los nombre propios empiezan por mayuscula, si no es un nombre propio no lo saluda
	if ! [[ $var =~ ^[A-Z] ]] ; then #Condicional que se ejecuta cuando la variable no coincide con la expresión regular
		echo "$var no parece ser un nombre, no lo saludo" 
	else
		echo "Hola $var" #Saluda al nombre propio
	fi
done

#Para tener un control de errores, omo poder podriamos tener un fichero con todos los nombres que existen y compararlo con las entradas de los argumentos
