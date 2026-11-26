#!/bin/bash
ip addr replace 192.230.4.166/30 dev eth0 && ip link set eth0 up  # Fuyutsuki
ip addr replace 192.230.4.73/29  dev eth1 && ip link set eth1 up  # Switch-Dogma
sysctl -w net.ipv4.ip_forward=1
ip -br a
