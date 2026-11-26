#!/bin/bash
set -e

INTERNAL_NET="192.230.0.0/16"
WAN_IF="eth0"

# Soal 2: IP Forwarding & DNS
sysctl -w net.ipv4.ip_forward=1
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Soal 3: Static Routing (dengan 4 CIDR Summarization)
ip route replace 192.230.0.0/23   via 192.230.4.110
ip route replace 192.230.3.0/25   via 192.230.4.110
ip route replace 192.230.4.0/27   via 192.230.4.110
ip route replace 192.230.4.32/28  via 192.230.4.110
ip route replace 192.230.4.136/29 via 192.230.4.110
ip route replace 192.230.4.144/30 via 192.230.4.110

ip route replace 192.230.2.0/24   via 192.230.4.114
ip route replace 192.230.3.224/27 via 192.230.4.114
ip route replace 192.230.4.148/30 via 192.230.4.114

ip route replace 192.230.3.128/26 via 192.230.4.118
ip route replace 192.230.4.48/29  via 192.230.4.118
ip route replace 192.230.4.96/30  via 192.230.4.118
ip route replace 192.230.4.152/29 via 192.230.4.118

ip route replace 192.230.4.100/30 via 192.230.4.122
ip route replace 192.230.4.64/29  via 192.230.4.126

ip route replace 192.230.4.80/28  via 192.230.4.130
ip route replace 192.230.4.168/30 via 192.230.4.130

ip route replace 192.230.3.192/27 via 192.230.4.134
ip route replace 192.230.4.56/29  via 192.230.4.134
ip route replace 192.230.4.72/29  via 192.230.4.134
ip route replace 192.230.4.160/29 via 192.230.4.134

# Reset aman iptables
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# Soal 5: INPUT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i "$WAN_IF" -p udp --sport 67 --dport 68 -j ACCEPT
iptables -A INPUT ! -i "$WAN_IF" -s "$INTERNAL_NET" -j ACCEPT

# Soal 5: FORWARD
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD ! -i "$WAN_IF" -o "$WAN_IF" -s "$INTERNAL_NET" -j ACCEPT
iptables -A FORWARD ! -i "$WAN_IF" ! -o "$WAN_IF" -s "$INTERNAL_NET" -d "$INTERNAL_NET" -j ACCEPT

# Default Policy DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Soal 4: NAT Masquerade
iptables -t nat -A POSTROUTING -s "$INTERNAL_NET" -o "$WAN_IF" -j MASQUERADE
