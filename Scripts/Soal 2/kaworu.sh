#!/bin/bash
ip addr replace 192.230.4.150/30 dev eth0 && ip link set eth0 up  # Hikari
ip addr replace 192.230.3.225/27 dev eth1 && ip link set eth1 up  # Switch-Relay
sysctl -w net.ipv4.ip_forward=1
ip -br a
