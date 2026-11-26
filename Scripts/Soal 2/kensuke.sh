#!/bin/bash
ip addr replace 192.230.4.154/30 dev eth0 && ip link set eth0 up  # Asuka
ip addr replace 192.230.3.129/26 dev eth1 && ip link set eth1 up  # Switch-Bunker
sysctl -w net.ipv4.ip_forward=1
ip -br a
