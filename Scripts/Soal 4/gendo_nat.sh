#!/bin/bash
set -e
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt update && apt install -y ifupdown iptables conntrack

iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -s 192.230.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -L POSTROUTING -n -v --line-numbers
