#!/bin/bash
ip addr replace 192.230.4.158/30 dev eth0 && ip link set eth0 up  # Asuka
ip addr replace 192.230.4.49/29  dev eth1 && ip link set eth1 up  # Switch-Lab
sysctl -w net.ipv4.ip_forward=1
ip -br a
