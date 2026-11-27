#!/bin/bash

CASPER="192.230.4.58"
ZERUEL="192.230.4.82"
PENPEN="192.230.3.194"

iptables -t nat -D PREROUTING -s $CASPER -d $ZERUEL -p tcp -j DNAT --to-destination $PENPEN 2>/dev/null
iptables -t nat -A PREROUTING -s $CASPER -d $ZERUEL -p tcp -j DNAT --to-destination $PENPEN
