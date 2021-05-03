#/bin/bash

let arit=1 #Inicializo las variables
let geom=1

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
	echo "No has pasado un argumento valido"
	exit
fi

while [ $arit -le $1 ] #Mientras sea menor que N se imprime
do
	echo $arit
	let arit=$arit+1
done

#Simplemente se suma 1 al anterior o se suma a si mismo

let cont=0
while [ $cont -lt $1 ] #Agregamos el contador al ser geometrica
do
        echo $geom
	let cont=$cont+1
        let geom=$geom+$geom
done