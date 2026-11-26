#!/bin/bash
ip addr replace 192.230.4.122/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.4.101/30 dev eth1 && ip link set eth1 up  # Switch-Intel
sysctl -w net.ipv4.ip_forward=1
ip -br a
