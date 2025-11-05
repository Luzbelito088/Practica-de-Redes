#!/usr/bin/env bash

CLARIN=$(dig +short www.clarin.com | head -n 1)

echo "=== PERMITIR CLARIN ($CLARIN) ==="

sudo iptables -A OUTPUT -d "$CLARIN" -j ACCEPT
sudo iptables -A INPUT -s "$CLARIN" -j ACCEPT

echo "Trafico permitido hacia clarin"
