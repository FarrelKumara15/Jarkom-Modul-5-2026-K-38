#!/bin/bash
ip addr replace 192.230.4.110/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.3.1/25   dev eth1 && ip link set eth1 up  # Switch-Hangar
ip addr replace 192.230.4.137/30 dev eth2 && ip link set eth2 up  # Rei
ip addr replace 192.230.4.141/30 dev eth3 && ip link set eth3 up  # Shinji
ip addr replace 192.230.4.145/30 dev eth4 && ip link set eth4 up  # Mari
sysctl -w net.ipv4.ip_forward=1
ip -br a
