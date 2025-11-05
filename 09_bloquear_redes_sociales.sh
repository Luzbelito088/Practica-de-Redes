#!/usr/bin/env bash

DOMINIO=("facebook.com" "x.com" "instagram.com" "tiktok.com" "linkedin.com")

echo "=== BLOQUEAR REDES SOCIALES ==="

for d in "DOMINIO[@]"; do
	IP=$(dig +short "$d" | tail -n1)
	if [ -n "$IP" ]; then
		sudo iptables -A OUTPUT -d "$IP" -j DROP
		sudo iptables -A INPUT -s "$IP" -j DROP
		echo "Bloqueado $d ($IP)"
	else
		echo "No se puede resolver $d"
	fi
done
