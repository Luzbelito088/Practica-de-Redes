#!/usr/bin/env bash

UNSJ=$(dig +short www.unsj.edu.ar | head -n 1)

echo "=== PERMITIR UNSJ ($UNSJ) ==="

sudo iptables -A OUTPUT -d "$UNSJ" -j ACCEPT
sudo iptables -A INPUT -d "$UNSJ" -j ACCEPT

echo "Trafico permitido hacia UNSJ"
