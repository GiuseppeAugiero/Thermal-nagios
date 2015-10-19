#!/bin/bash
################################################################
# Thermal Farm Control v.1.0 17/01/2008
# By Giuseppe Augiero (oss@augiero.it)
# This software is distributited under GPL v.2.0
################################################################
#
# Sintassi : ./thc temperatatua_di_soglia
#       es.: ./thc 30

PARAMETRI=0
DIGITEMPRC="/etc/digitemprc"

#Controllo numero di parametri
if [ $# -eq $PARAMETRI ];
       then
           echo "Occorre inserire come parametro la soglia di temperatura"
           exit 1;
fi

#Leggo la temperatura dal sensore eliminando eventuali decimali
temperatura=`digitemp_DS9097 -c $DIGITEMPRC -s /dev/ttyS0 -aq | cut -d' ' -f7 | cut -d. -f1`

if [ `expr $temperatura \< $1`  -eq 1 ];
        then
                echo "OK: " `digitemp_DS9097 -c $DIGITEMPRC -s /dev/ttyS0 -aq`
                exit 0;
        else
                echo "Alert: " `digitemp_DS9097 -c $DIGITEMPRC -s /dev/ttyS0 -aq`
                exit 2;
fi
