#!/bin/bash
sysctl net.ipv4.ip_forward
ip -br a
ip route show
ip rule show
iptables -S
iptables -L -n -v --line-numbers
ping -c 2 -W 2 192.230.4.129
