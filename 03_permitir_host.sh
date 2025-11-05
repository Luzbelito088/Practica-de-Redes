#!/usr/bin/env bash

read -p "Ingrese la IP del host a permitir: " COMPA_IP

if [[ -z "$COMPA_IP" ]]; then
	echo "No ingreso ninguna IP"
	exit 1
fi

echo "=== PERMITIR HOST DEL COMPA ($COMPA_IP) ==="

sudo iptables -A INPUT -s "$COMPA_IP" -j ACCEPT
sudo iptables -A OUTPUT -d "$COMPA_IP" -j ACCEPT

sudo iptables -L -v -n | grep "$COMPA_IP"

echo "Trafico permitido desde y hacia $COMPA_IP"
