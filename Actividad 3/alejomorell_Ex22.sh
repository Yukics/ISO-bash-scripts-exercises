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

for i in `find $1 -type d 2> /dev/null` #Iteramos unicamente por los directorios y su ruta absoluta en caso de necesitar root y dar error se redirige a dev null
do 
    mkdir -p tmp`echo $i|sed 's/\.\///'` 2>/dev/null #Agregamos los directorios a nuestro directorio temporal de form ajerarquica, y el sed le añade las /
done

cd tmp #Nos movemos al directorio y hacemos un tar de su contenido
tar -zcf tarfile.tar * 2> /dev/null
cd .. #Movemos el tar fuera de tmp y borramos tmp
mv tmp/tarfile.tar tarfile.tar
rm -fr tmp 2> /dev/null
