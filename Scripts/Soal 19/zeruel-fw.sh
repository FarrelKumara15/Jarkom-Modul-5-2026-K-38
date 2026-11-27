#!/bin/sh

ARM="192.230.4.83"

iptables -C INPUT -s $ARM -j DROP 2>/dev/null || iptables -I INPUT 1 -s $ARM -j DROP
iptables -C OUTPUT -d $ARM -j DROP 2>/dev/null || iptables -I OUTPUT 1 -d $ARM -j DROP
