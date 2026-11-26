#!/bin/bash
ip addr replace 192.230.4.138/30 dev eth0 && ip link set eth0 up  # Yui
ip addr replace 192.230.0.1/23   dev eth1 && ip link set eth1 up  # Switch-Quarters
sysctl -w net.ipv4.ip_forward=1
ip -br a
