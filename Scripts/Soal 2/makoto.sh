#!/bin/bash
ip addr replace 192.230.4.170/30 dev eth0 && ip link set eth0 up  # Shigeru
ip addr replace 192.230.4.89/29  dev eth1 && ip link set eth1 up  # Switch-Radar
sysctl -w net.ipv4.ip_forward=1
ip -br a
