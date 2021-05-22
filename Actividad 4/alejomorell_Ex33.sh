#/bin/bash
#Si se ejecuta con sh en vez de con bash, dará error
#El tipo de usuario que debe ejecutar este script debe ser admin
if [ $EUID == 0 ]
then #Cuando se ejecuta como superusuario el user id es 0 de root, cuando se da la condicion imprime esto
    nprim=`sudo parted -l 2> /dev/null | grep "primary" | wc -l` 
    #Con esto sacamos los discos y sus particiones y en caso de error redirigimos la salidad a null, 
    #y contamos cuantos de los discos son primarios, extendidos o logicos
    echo "Nº de particiones primarias: $nprim"
    next=`sudo parted -l 2> /dev/null | grep "extended" | wc -l`
    echo "Nº de particiones extendidas: $next"
    nlog=`sudo parted -l 2> /dev/null | grep "logical" | wc -l` 
    #Debido a que logical es una palabra que tambien sale en la salida dando otro 
    #tipo de información hay que restar uno al numero de logicals
    echo "Nº de particiones logicas: $(($nlog - 1))"
else
    echo "Este script debe ejecutarse como root"
fi
