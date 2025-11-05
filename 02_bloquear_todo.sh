#!/usr/bin/env bash

echo "=== BLOQUEAR TODO EL TRAFICO ==="

sudo iptables -F
sudo iptables -X

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

echo "Todo el trafico entrante y saliente fue bloqeado"
