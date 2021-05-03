#/bin/bash

let arit=1 #Inicializo las variables
let geom=1

re='^[0-9]+$' #Lo mismo que en dos ejercicios anteriores
if ! [[ $1 =~ $re ]] ; then
	echo "No has pasado un argumento valido"
	exit
fi
echo "Sucesion aritmetica"
while [ $arit -le $1 ] #Mientras sea menor que N se imprime la secuencia de n+1
do
	echo $arit
	let arit=$arit+1
done

echo "Sucesion geometrica"
let cont=0
while [ $cont -lt $1 ] #Agregamos el contador al ser geometrica para tener en cuenta las iteraciones, y mientras sea menor que N se imprime la secuencia de n+n
do
    echo $geom
	let cont=$cont+1
    let geom=$geom+$geom
done