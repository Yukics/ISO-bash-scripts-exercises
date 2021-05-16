#/bin/bash
if [ $# != 1 ] #Comprobamos que el numero de parametros introducidos es correcto
then
    echo    "Has introducido un numero correcto de argumentos"
    exit
fi

if ! `test -d $1`   #Comprobamos que el primer parametro sea un directorio
then
    echo "El primer parametro no es un directorio"
    exit
fi


for i in $1/*.c #Iteramos los archivos de directorio
do
    full=`grep -c "" $i` #Contamos las lineas totales del ficehro iteado
    blank=`grep -c "^$" $i` #Contamos las lineas vacias
    notblank=`expr $full - $blank` #Hacemos la resta, las lineas llenas
    echo "`basename $i` $notblank" >> linies.txt #Agregamos la salida al fichero de texto linies
done

cat linies.txt