#!/bin/bash

cat /etc/passwd | cut -d: -f7 | sort | uniq -c | sort | tail -1 | awk '{print $NF}'
#Primero mostramos el contenido de passwd, delimitamos el contenido dividiendo por ":", escogemos el 7º campo
#perteneciente al interprete de comandos de cada usuario, los ordenamos, los contamos y ordenamos de nuevo el resultado para que
#nos muestre los que mas se han repetido al final. Para acabar con awk definimos que se muestre el el último campo desde el 
#ultimo espacio de la string
