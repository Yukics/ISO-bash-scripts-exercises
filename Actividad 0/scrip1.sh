#/bin/bash
a=5
b=65
c=75
d=`expr $a + $b + $c`
let e=$a^3+$c
f=`expr 123 % $a`
g=`expr 7 + 30`
h=`expr $g + 1`
read i
i=`expr $i + 1`
echo "D es $d, E es $e, F es $f, G es $g, H es $h, I es $i"
