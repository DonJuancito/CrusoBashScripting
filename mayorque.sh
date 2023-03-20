#!/bin/bash

#function mayorque(){
    
    #if (( $1 > $2 )); then
   #     echo "El $1 es mayor que el $2"
  #  else
    #    echo "El $2 es mayor que el $1"
 #   fi

#}

#function igualque(){

   # if (( 100 == 100 )); then
  #      echo "Claramente son iguales"
 #   fi

#}

#mayorque 6 98
#igualque

#function mayordetres(){

#    if (( $1 > $2 & $2 < $3 )); then
#        echo "$1 es mas grande que $2 y $3"
#    fi
#}

#mayordetres



#ip_de_apache=999.000.000.000

#patron=^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}

#if [[ "$ip_de_apache" =~ $patron ]] 
#then
 #   echo el patron es correcto
#fi

. ./dia2

function partirtextos(){
    local _texto=$1
    local _ancho_linea_maximo=$2

    local _ancho_palabra
    local _ancho_linea_actual=0

    for palabra in $_texto
    do
        _ancho_palabra=${#palabra}
        if (( $_ancho_linea_actual + $_ancho_palabra > $_ancho_linea_maximo ))
        then
            # En este acso, tengo que ir a una linea nueva antes de aádir la palabra
            echo ""
            echo -n "$palabra "
            let _ancho_linea_actual=$_ancho_palabra+1
        else
            echo -n "$palabra "
            let _ancho_linea_actual=$_ancho_linea_actual+$_ancho_palabra+1
        fi
    done
}

contenido=$(cat texto.txt)

ancho=80 

partirtextos "$contenido" $ancho
