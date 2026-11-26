#!/bin/bash
# Jalankan di router lain (Misato, Shigeru, Fuyutsuki, dll.) setelah NAT di Gendou aktif
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt update && apt install -y ifupdown iptables conntrack
