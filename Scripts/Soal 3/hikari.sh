#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ip route replace default          via 192.230.4.113
ip route replace 192.230.3.224/27 via 192.230.4.150
