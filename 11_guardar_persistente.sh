#!/usr/bin/env bash

echo "=== HACER REGLAS PERSISTENTES ==="

if ! dpkg -s iptables-persistent >/dev/null 2>&1; then
	echo "Instalando iptables-persistentes..."
	sudo apt install -y iptables-persistent
fi

sudo netfilter-persistent save
echo "Reglas guardadas. Se cargaran automaticamente al iniciar el sistema."
