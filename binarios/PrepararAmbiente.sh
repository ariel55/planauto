


function verificar_instalacion {
	echo OK
}

function verificar_permisos {
	echo OK
}

function inicializar_variables {
	BINDIR=`cat "../config/CIPAL.cnf" | grep "^BINDIR" | sed "s/\(BINDIR\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export BINDIR
	MAEDIR=`cat "../config/CIPAL.cnf" | grep "^MAEDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export MAEDIR
	ARRDIR=`cat "../config/CIPAL.cnf" | grep "^ARRDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export ARRDIR
	OKDIR=`cat "../config/CIPAL.cnf" | grep "^OKDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export OKDIR
	PROCDIR=`cat "../config/CIPAL.cnf" | grep "^PROCDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export PROCDIR
	INFODIR=`cat "../config/CIPAL.cnf" | grep "^INFODIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export INFODIR
	LOGDIR=`cat "../config/CIPAL.cnf" | grep "^LOGDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export LOGDIR
	NOKDIR=`cat "../config/CIPAL.cnf" | grep "^NOKDIR" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export NOKDIR
	LOGSIZE=`cat "../config/CIPAL.cnf" | grep "^LOGSIZE" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export LOGSIZE
	SLEEPTIME=`cat "../config/CIPAL.cnf" | grep "^SLEEPTIME" | sed "s/\([^=]*\)=\([^=]*\)=\([^=]*\)=\([^=]*\)/\2/"`
	export SLEEPTIME
	return 0
}



if [ "$AMBIENTE_INICIALIZADO" == "SI" ]; then
	echo "Ambiente ya inicializado, para reiniciar termine la sesión e ingrese nuevamente"
	$BINDIR/GrabarBitacora.sh "PrepararAmbiente" "Ambiente ya inicializado" "ERR"
	return 1
fi

inicializar_variables
instalacion_ok=`verificar_instalacion`
permisos_ok=`verificar_permisos`

if [ "$instalacion_ok" == "OK" ] && [ "$permisos_ok" == "OK" ]; then
	AMBIENTE_INICIALIZADO="SI"
	export AMBIENTE_INICIALIZADO
	$BINDIR/GrabarBitacora.sh "PrepararAmbiente" "Estado del Sistema: INICIALIZADO"
fi




