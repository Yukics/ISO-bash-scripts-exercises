#/bin/bash

trimestre=$(date +"%q") #Extraemos el trimestre 1,2,3 o 4

if [ $trimestre -ge 3 ]; then #En caso de ser 3 o mayor
	echo "Estamos en los ultimos seis meses"
else
	echo "Estamos en los primeros seis meses"
fi
