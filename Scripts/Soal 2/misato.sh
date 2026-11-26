#!/bin/bash
ip addr replace 192.230.4.126/30 dev eth0 && ip link set eth0 up  # Gendou
ip addr replace 192.230.4.65/29  dev eth1 && ip link set eth1 up  # Switch-Cage
sysctl -w net.ipv4.ip_forward=1
ip -br a
