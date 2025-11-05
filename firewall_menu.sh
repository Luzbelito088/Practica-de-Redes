#!/usr/bin/env bash
#firewall_menu.sh - menu principal del sistema de reglas IPTABLEs

set -eou pipefail

SCRIPTS_DIR="$(dirname "$0")"

while true; do
	clear
	echo "====================="
	echo "MENU DE CONFIGURACION IPTABLES"
	echo "====================="
	echo "1) Asegurar y verificar iptables"
	echo "2) Bloquear todo el trafico"
	echo "3) Permitir trafico desde host compañero"
	echo "4) Bloquear trafico desde rango IP"
	echo "5) Bloquear trafico hacia Gloogle"
	echo "6) Bloquear acceso al DNS"
	echo "7) Permitir trafico desde Clarin"
	echo "8) Permitir trafico hacia UNSJ"
	echo "9) Denegar acceso a redes sociales"
	echo "10) Denegar acceso POP mail"
	echo "11) Hacer reglas persistentes"
	echo "0) salir"
	read -rp "Seleccione una opcion: " OPC
	
	case "$OPC" in
		1) sudo bash "$SCRIPTS_DIR/01_verificar_iptables.sh" ;;
		2) sudo bash "$SCRIPTS_DIR/02_bloquear_todo.sh" ;;
		3) sudo bash "$SCRIPTS_DIR/03_permitir_host.sh" ;;
		4) sudo bash "$SCRIPTS_DIR/04_bloquear_rango.sh" ;;
		5) sudo bash "$SCRIPTS_DIR/05_bloquear_google.sh" ;;
		6) sudo bash "$SCRIPTS_DIR/06_bloquear_dns.sh" ;;
		7) sudo bash "$SCRIPTS_DIR/07_permitir_clarin.sh" ;;
		8) sudo bash "$SCRIPTS_DIR/08_permitir_unsj.sh" ;;
		9) sudo bash "$SCRIPTS_DIR/09_bloquear_redes_sociales.sh" ;;
		10) sudo bash "$SCRIPTS_DIR/10_bloquear_popmail.sh" ;;
		11) sudo bash "$SCRIPTS_DIR/11_guardar_persistente.sh" ;;
		0) echo "saliendo..."; exit 0 ;;
		*) echo "opcion invalida." ;;
	esac
	
	echo
	read -rp "Presione Enter para volver al menu..."
done
