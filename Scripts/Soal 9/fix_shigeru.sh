#!/bin/bash

ip rule del pref 90 2>/dev/null || true
ip route del blackhole 192.230.4.72/29 2>/dev/null || true

ip addr replace 192.230.4.130/30 dev eth0 && ip link set eth0 up
ip addr replace 192.230.4.81/29  dev eth1 && ip link set eth1 up
ip addr replace 192.230.4.169/30 dev eth2 && ip link set eth2 up

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F

bash /root/shigeru.sh
ip route show
ip rule show
