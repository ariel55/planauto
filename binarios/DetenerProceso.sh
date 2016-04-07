#!/bin/bash

# parametro nombre del proceso a detener sin .sh

if [ $# -lt 1 ]; then
	echo "Falta indicar el nombre del proceso a detener"
	exit
fi

pid=`pidof -x  "$1.sh"`
if ! [ -z $pid ]; then
	pkill "$1.sh"
	echo "$1 detenido"
else
	echo "$1 no esta en ejecucion"
fi

