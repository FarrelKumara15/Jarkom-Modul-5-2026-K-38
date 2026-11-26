#!/bin/bash
ip addr replace 192.230.4.114/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.2.1/24   dev eth1 && ip link set eth1 up  # Switch-Comm
ip addr replace 192.230.4.149/30 dev eth2 && ip link set eth2 up  # Kaworu
sysctl -w net.ipv4.ip_forward=1
ip -br a
