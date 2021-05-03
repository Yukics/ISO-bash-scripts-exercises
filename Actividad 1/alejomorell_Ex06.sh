#/bin/bash

for var in "$@";do #Con $@ iteramos sobre la lista de todos los argumentos pasados
	echo "Hola $var"
done
