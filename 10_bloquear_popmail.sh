#!/usr/bin/env bash

echo "=== BLOQUEAR POP MAIL ==="

sudo iptables -A OUTPUT -p tcp --dport 110 -j DROP
sudo iptables -A OUTPUT -p tcp --dport 995 -j DROP
sudo iptables -A INPUT -p tcp --sport 110 -j DROP
sudo iptables -A INPUT -p tcp --sport 995 -j DROP

echo "Bloqueado POP3 y POP35 (puertos 110 y 995)"
