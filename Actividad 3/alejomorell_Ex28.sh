#/bin/bash

user=`cat /etc/passwd | cut -d: -f1 | grep $1` #Compruebo si existe algún usuario llamado como el argumento

if [ `echo $user | wc -w` -eq `echo $1 | wc -w` ] #Compruebo si la longitud del argumento y de la variable de usuario concuerdan
then 
    echo `cat /etc/group | grep $user | cut -d: -f1` #En tal caso extraigo todos los grupos en los que este el usuario
else
    echo "Usuario $1 no existe $user" #Notificacion de error
fi