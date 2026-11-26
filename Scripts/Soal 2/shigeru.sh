#!/bin/bash
ip addr replace 192.230.4.130/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.4.81/29  dev eth1 && ip link set eth1 up  # Switch-Monolith
ip addr replace 192.230.4.169/30 dev eth2 && ip link set eth2 up  # Makoto
sysctl -w net.ipv4.ip_forward=1
ip -br a
