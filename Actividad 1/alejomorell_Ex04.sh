read -p "Dime un numero> " num

re='^[0-9]+$'
if ! [[ $num =~ $re ]] ; then
	echo "No has introducido un numero"
else
	cut -d: -f1 /etc/passwd | sort | tail -$num
fi
