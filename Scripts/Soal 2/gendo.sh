#!/bin/bash
# eth0 menggunakan DHCP dari NAT1
ip addr replace 192.230.4.105/30 dev eth1 && ip link set eth1 up  # Switch-Cmd
ip addr replace 192.230.4.109/30 dev eth2 && ip link set eth2 up  # Yui
ip addr replace 192.230.4.113/30 dev eth3 && ip link set eth3 up  # Hikari
ip addr replace 192.230.4.117/30 dev eth4 && ip link set eth4 up  # Asuka
ip addr replace 192.230.4.121/30 dev eth5 && ip link set eth5 up  # Kaji
ip addr replace 192.230.4.125/30 dev eth6 && ip link set eth6 up  # Misato
ip addr replace 192.230.4.129/30 dev eth7 && ip link set eth7 up  # Shigeru
ip addr replace 192.230.4.133/30 dev eth8 && ip link set eth8 up  # Fuyutsuki
sysctl -w net.ipv4.ip_forward=1
ip -br a
