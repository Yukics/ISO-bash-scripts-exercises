#/bin/bash


read x

let y=$x%2

if [ $y -eq 0 ]
then
	echo "El $x es par"
else
	echo "El $x es impar"
fi
