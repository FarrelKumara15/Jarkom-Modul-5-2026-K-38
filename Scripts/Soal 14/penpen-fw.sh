#!/bin/bash

# Variabel dalam UTC (iptables membaca UTC; WIB = UTC+7)
PILOT_START="01:00"
PILOT_STOP="09:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="10:00"
STAF_STOP="16:00"

DUMMY="192.230.4.50 192.230.4.51 192.230.4.102"
PILOT="192.230.4.66 192.230.4.67 192.230.4.68 192.230.3.130"
STAF="192.230.4.74 192.230.4.75"

iptables -N PENPEN 2>/dev/null
iptables -F PENPEN

for ip in $DUMMY; do
  iptables -A PENPEN -s $ip -j DROP
done
for ip in $PILOT; do
  iptables -A PENPEN -s $ip -m time --timestart $PILOT_START --timestop $PILOT_STOP --weekdays $PILOT_DAYS -j ACCEPT
  iptables -A PENPEN -s $ip -j DROP
done
for ip in $STAF; do
  iptables -A PENPEN -s $ip -m time --timestart $STAF_START --timestop $STAF_STOP -j ACCEPT
  iptables -A PENPEN -s $ip -j DROP
done

# Sambungkan ke INPUT hanya untuk ping dan TCP 80 (idempoten)
iptables -D INPUT -p icmp --icmp-type echo-request -j PENPEN 2>/dev/null
iptables -D INPUT -p tcp --dport 80 -j PENPEN 2>/dev/null
iptables -I INPUT -p icmp --icmp-type echo-request -j PENPEN
iptables -I INPUT -p tcp --dport 80 -j PENPEN
