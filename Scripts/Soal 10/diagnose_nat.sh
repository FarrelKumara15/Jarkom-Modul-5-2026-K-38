#!/bin/bash
iptables -t nat -S
iptables -t nat -L -n -v --line-numbers
iptables -S
iptables -L FORWARD -n -v --line-numbers
iptables -t mangle -S
ip route show
