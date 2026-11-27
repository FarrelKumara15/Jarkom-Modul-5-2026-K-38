#!/bin/bash

iptables -N PINGLIM 2>/dev/null
iptables -F PINGLIM
iptables -A PINGLIM -m limit --limit 5/second --limit-burst 5 -j ACCEPT
iptables -A PINGLIM -j DROP

iptables -D INPUT -p icmp --icmp-type echo-request -j PINGLIM 2>/dev/null
iptables -I INPUT 1 -p icmp --icmp-type echo-request -j PINGLIM
