#!/bin/bash

OUT_IF="eth0"
TERMINAL="192.230.4.56/29"

iptables -N ZONA 2>/dev/null
iptables -F ZONA
iptables -A ZONA -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A ZONA -s $TERMINAL -p icmp --icmp-type echo-request -j ACCEPT
iptables -A ZONA -j DROP

iptables -D FORWARD -i $OUT_IF -j ZONA 2>/dev/null
iptables -I FORWARD 1 -i $OUT_IF -j ZONA
