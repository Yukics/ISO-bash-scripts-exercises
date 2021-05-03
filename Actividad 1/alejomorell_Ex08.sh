#/bin/bash


let mult=2
let factorial=$1
re='^[0-9]+$'


if ! [[ $1 =~ $re ]] ; then
	echo "El argumento pasado no es numerico"
else
	while [ $1 -gt $mult ] #Mientras la iteracion de la variable que lo multiplica sea menor al argumento
	do
		let factorial=$factorial*$mult
		let mult=$mult+1
	done

	echo $factorial

	let mult=2
	let factorial=$1

	until [ $1 -le $mult ] #Mientras la iteracion de la variable que lo multiplica sea menor al argumento
	do
        	let factorial=$factorial*$mult
	        let mult=$mult+1
	done

	echo $factorial
fi
