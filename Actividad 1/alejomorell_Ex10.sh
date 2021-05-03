#/bin/bash

re='^[0-9]+$'
n1=$1
n2=$2
result=() #Esto es un array 
#Paso la entrada de los argumentos a variables, 
#porque me dice la consola que no son operables
#y ademas asi los uso en el bucle y en el resto del script


if ! [[ $n1 =~ $re || $n2 =~ $re ]] ; then #Comprobacion que son numericos
	echo "El argumento pasado no es numerico"
else
	if [ $# -gt 2 ]; then #Comprobacion que son dos argumentos
		echo "Has introducido mas de 2 argumentos, solo utilizare los dos primeros"
	fi
	if [ $n1 -gt $n2 ]; then
		signo="-"
	else 
		signo="+"
	fi
	
	while ! [ $n1 -eq $n2 ] 
	do	
		result+=`echo "$n1 "`
		let n1=$n1`echo $signo`1
	done
	
	result+=`echo "$n1 "` #He creido que haciendolo asi era muy faccil de entender
	echo $result
fi
