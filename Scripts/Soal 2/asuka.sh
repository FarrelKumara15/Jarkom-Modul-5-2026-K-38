#!/bin/bash
ip addr replace 192.230.4.118/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.4.97/30  dev eth1 && ip link set eth1 up  # Switch-Archive
ip addr replace 192.230.4.153/30 dev eth2 && ip link set eth2 up  # Kensuke
ip addr replace 192.230.4.157/30 dev eth3 && ip link set eth3 up  # Ritsuko
sysctl -w net.ipv4.ip_forward=1
ip -br a
