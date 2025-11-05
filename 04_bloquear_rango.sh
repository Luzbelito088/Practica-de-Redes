#!/usr/bin/env bash

read -p "Ingrese el rango de IP a bloquear (por ejemplo: 192.168.0.0-192.168.0.50): " RANGO

if [[ -z "$RANGO" ]]; then
	echo "No ingreso ningun rango. Abortando."
	exit 1
fi


echo "=== BLOQUEAR RANGO $RANGO ==="

sudo iptables -A INPUT -m iprange --src-range "$RANGO" -j DROP
sudo iptables -A OUTPUT -m iprange --dst-range "$RANGO" -j DROP

#Mostrando la confirmaciòn
sudo iptables -L -v -n | grep "$RANGO"

echo "Bloqueado trafico desde el rango $RANGO"
