#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ip route replace default         via 192.230.4.129
ip route replace 192.230.4.88/29 via 192.230.4.170
