#/bin/bash

read -p "Dame un día para saber que sería: " dia

let dias=$dia%7

if [ $dias==0 ]; then
	echo "Lunes"
elif [ $dias==1 ]; then
	echo "Martes"
elif [ $dias==2 ]; then
        echo "Miercoles"
elif [ $dias==3 ]; then
        echo "Jueves"
elif [ $dias==4 ]; then
        echo "Viernes"
elif [ $dias==5 ]; then
        echo "Sabado"
elif [ $dias==6 ]; then
        echo "Domingo"
fi
