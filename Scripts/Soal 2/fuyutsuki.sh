#!/bin/bash
ip addr replace 192.230.4.134/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.4.57/29  dev eth1 && ip link set eth1 up  # Switch-Terminal
ip addr replace 192.230.4.161/30 dev eth2 && ip link set eth2 up  # Maya
ip addr replace 192.230.4.165/30 dev eth3 && ip link set eth3 up  # Toji
sysctl -w net.ipv4.ip_forward=1
ip -br a
