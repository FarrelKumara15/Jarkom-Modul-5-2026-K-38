#!/bin/bash

ARM="192.230.4.83"

iptables -N ISOLASI 2>/dev/null
iptables -F ISOLASI
iptables -A ISOLASI -s $ARM -j DROP
iptables -A ISOLASI -d $ARM -j DROP

iptables -D FORWARD -j ISOLASI 2>/dev/null
iptables -I FORWARD 1 -j ISOLASI

iptables -D INPUT -s $ARM -j DROP 2>/dev/null
iptables -I INPUT 1 -s $ARM -j DROP
iptables -D OUTPUT -d $ARM -j DROP 2>/dev/null
iptables -I OUTPUT 1 -d $ARM -j DROP
