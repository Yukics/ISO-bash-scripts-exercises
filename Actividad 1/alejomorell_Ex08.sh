#/bin/bash


let mult=2
let factorial=$1
re='^[0-9]+$'


if ! [[ $1 =~ $re ]] ; then #En caso de que no se cumpla la expresion regular
	echo "El argumento pasado no es numerico"
else
	echo "Bucle while"
	while [ $1 -gt $mult ] #Mientras la iteracion de la variable que lo multiplica sea menor al argumento
	do
		let factorial=$factorial*$mult #Operacion de factorial n*n-1*n-2...n*(n-n+1)
		let mult=$mult+1
	done

	echo $factorial

	let mult=2
	let factorial=$1

	echo "Bucle until"
	until [ $1 -le $mult ] #Mientras la iteracion de la variable que lo multiplica sea menor al argumento
	do
        	let factorial=$factorial*$mult
	        let mult=$mult+1
	done

	echo $factorial
fi
