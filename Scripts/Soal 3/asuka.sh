#!/bin/bash
ip addr replace 192.230.4.118/30 dev eth0 && ip link set eth0 up
ip addr replace 192.230.4.97/30  dev eth1 && ip link set eth1 up
ip addr replace 192.230.4.153/30 dev eth2 && ip link set eth2 up
ip addr replace 192.230.4.157/30 dev eth3 && ip link set eth3 up
sysctl -w net.ipv4.ip_forward=1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ip route replace default          via 192.230.4.117
ip route replace 192.230.3.128/26 via 192.230.4.154
ip route replace 192.230.4.48/29  via 192.230.4.158
