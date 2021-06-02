#/bin/bash

re='^[0-9]+$' #Definimos la expresion regular para comparar

count=1
i=$(echo $@ | cut -d' ' -f`echo $count`) #Sacamos el primer parametro de la array

while true #Un bucle que se ejcuta indefinidamente
do
    if ! [[ "$i" =~ $re ]] #Si i no es un numero lo indica pero como lo tendía repetido luego abajo y puesto que solo es un aviso no interrumpe el script reenvia a null
    then
        echo "$i no es un numero" > /dev/null
    fi
    
    if [ $count -eq $# ] #Cuando el contador y el numero total de parametros coinciden se sale del bucle
    then
        break
    fi

    let count+=1 #Se incrementa la variable en uno
    i=$(echo $@ | cut -d' ' -f`echo $count`) #Se le otorga un nuevo valor a i   

done

for i in $@ #Se recorre la array y en caso de que grep encuentre que el ultimo digito es par o impar muestra por pantalla el resultado
do
    if ! [[ "$i" =~ $re ]] #Si i no es un numero lo indica
    then
        echo "$i no es un numero"       
    elif echo $i | grep -E '9$' > /dev/null #El dev null es necesario puesto que si no, saldría la salida del grep
    then
        echo "$i es senar"
    elif echo $i | grep -E '8$' > /dev/null
    then
        echo "$i es parell"
    elif echo $i | grep -E '7$' > /dev/null
    then
        echo "$i es senar"
    elif echo $i | grep -E '6$' > /dev/null
    then
        echo "$i es parell"
    elif echo $i | grep -E '5$' > /dev/null
    then
        echo "$i es senar"
    elif echo $i | grep -E '4$' > /dev/null
    then
        echo "$i es parell"
    elif echo $i | grep -E '3$' > /dev/null
    then
        echo "$i es senar"
    elif echo $i | grep -E '2$' > /dev/null
    then
        echo "$i es parell"
    elif echo $i | grep -E '1$' > /dev/null
    then
        echo "$i es senar"
    elif echo $i | grep -E '0$' > /dev/null
    then
        echo "$i es parell"
    fi    
done