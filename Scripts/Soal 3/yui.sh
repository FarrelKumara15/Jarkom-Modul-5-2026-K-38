#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ip route replace default          via 192.230.4.109
ip route replace 192.230.0.0/23   via 192.230.4.138
ip route replace 192.230.4.0/27   via 192.230.4.142
ip route replace 192.230.4.32/28  via 192.230.4.146
