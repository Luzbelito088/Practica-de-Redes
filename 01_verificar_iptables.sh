#!/usr/bin/env bash

echo "=== Verificacion iptables ==="

if ! command -V iptables >/dev/null 2>&1; then
	echo "Iptables no esta instalado. Instalando..."
	sudo apt update && sudo apt install -y iptables
else
	echo "iptables esta instalado."
fi

if pidof systemd >/dev/nulll 2>&1; then
	if systemctl is-active --quiet iptables; then
		echo "iptables esta en ejecucion (systemd)"
	else
		echo "iptables no esta activo. Iniciando servicio..."
		sudo systemctl start iptables || echo "No se pudo iniciar el servicio iptables (puede no existir en esta distro)."
	fi
else
	echo "Este sistema no usa sysmod (usa init o sysvinit)."
	echo "Verificando manualmente si iptables esta cargado..."
	if sudo iptables -L >/dev/null 2>&1; then
		echo "iptables esta operativo."
	else
		echo "iptables no responde correctamente."
	fi
fi

echo
echo "=== Estado actual de las reglas ==="
sudo iptables -L -v -n

echo
echo "Verificacion completada."
