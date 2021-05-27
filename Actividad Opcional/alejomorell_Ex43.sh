#/bin/bash

read -p "Introduce un nombre de fichero: " file #Entrada del script

if ! [ -f $file ] #Comprobación de que la entrada es un fichero
then   
    echo "No has introducido un fichero"
    exit 1
fi

cat $file | awk {'print $2'} > listdates.txt #Extrae todas las fechas y las envia a un fichero que recorreremos en el bucle

maxdate=00/00/00 #Inicializa la variable de la persona mas joven
mindate=9999/9999/9999 #Inicializa la variable de la persona mas mayor

while read line; do #Recorremos el fichero temporal

# awk -F, '{split($1, a, "/"); print a[3] a[2] a[1]}' Este comando divide en una array cada / que haya y la reordena tal que añomesdia para poder comparar

    if [ `echo $line | awk -F, '{split($1, a, "/"); print a[3] a[2] a[1]}'` -ge `echo $maxdate | awk -F, '{split($1, a, "/"); print a[3] a[2] a[1]}'` ] #En caso de que la edad sea mas joven la reemplaza
    then
        maxdate=$line
    fi
    if [ `echo $line | awk -F, '{split($1, a, "/"); print a[3] a[2] a[1]}'` -le `echo $mindate | awk -F, '{split($1, a, "/"); print a[3] a[2] a[1]}'` ] #En caso de que la edad sea mas mayor la reemplaza
    then
        mindate=$line
    fi
done < listdates.txt
rm listdates.txt

echo "La persona mas mayor es `cat $file | grep $mindate`" #Output del script 
echo "La persona mas joven es `cat $file | grep $maxdate`"

