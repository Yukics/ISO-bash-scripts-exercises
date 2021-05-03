read -p "Dime un numero> " num #Registra la entrada en la variable num

re='^[0-9]+$' #Define una expresión regular numérica
if ! [[ $num =~ $re ]] ; then #Condicional que se ejecuta cuando la variable no coincide con la expresión regular
	echo "No has introducido un numero"
else
	cut -d: -f1 /etc/passwd | sort | tail -$num #Cut divide el contenido del archivo por columnas con el separador ":", sort ordena alfabeticamente, tail muestra n resultados definidos en la variable
	#Muestra los n ultimos usuarios ordenados a->z
fi
