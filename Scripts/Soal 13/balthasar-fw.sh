#!/bin/bash

ALLOWED="192.230.4.58 192.230.4.66 192.230.4.67 192.230.4.68 192.230.3.130"

iptables -F INPUT
iptables -P INPUT ACCEPT

for ip in $ALLOWED; do
  iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -s $ip -j ACCEPT
done
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -j REJECT --reject-with tcp-reset
