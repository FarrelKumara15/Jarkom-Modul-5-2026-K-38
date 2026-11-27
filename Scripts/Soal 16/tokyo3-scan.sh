#!/bin/bash

DUMMY="192.230.4.51"

iptables -N SCANGUARD 2>/dev/null
iptables -F SCANGUARD
iptables -A SCANGUARD -p tcp -j LOG --log-prefix "SCAN-NERV: "
iptables -A SCANGUARD -p tcp -j REJECT --reject-with tcp-reset

iptables -D INPUT -p tcp -s $DUMMY -m multiport --dports 22,23,3306 -j SCANGUARD 2>/dev/null
iptables -I INPUT 1 -p tcp -s $DUMMY -m multiport --dports 22,23,3306 -j SCANGUARD
