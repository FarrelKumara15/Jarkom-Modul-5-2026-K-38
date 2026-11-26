#!/bin/bash
ip addr replace 192.230.4.146/30 dev eth0 && ip link set eth0 up  # Yui
ip addr replace 192.230.4.33/28  dev eth1 && ip link set eth1 up  # Switch-Dock
sysctl -w net.ipv4.ip_forward=1
ip -br a
