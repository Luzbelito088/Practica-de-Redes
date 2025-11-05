#!/usr/bin/env bash

GOOGLE_IP="142.250.0.0/15"

echo "=== BLOQUEAR GOOGLE ==="

sudo iptables -A OUTPUT -d "$GOOGLE_IP" -j DROP
sudo iptables -A INPUT -s "$GOOGLE_IP" -j DROP

echo "BLoqueado trafico hacia y desde google ($GOOGLE_IP)"
