#!/usr/bin/env bash

echo "=== BLOQUEAR DNS ==="

sudo iptables -A OUTPUT -p udp --dport 53 -j DROP
sudo iptables -A OUTPUT -p tcp --dport 53 -j DROP
sudo iptables -A INPUT -p udp --sport 53 -j DROP
sudo iptables -A INPUT -p tcp --sport 53 -j DROP

echo "Bloqueado acceso al DNS (puerto 53 TCP/UDP)"
