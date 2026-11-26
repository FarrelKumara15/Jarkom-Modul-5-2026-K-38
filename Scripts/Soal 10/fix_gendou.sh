#!/bin/bash
iptables -t mangle -F
iptables -t mangle -X
bash /root/gendo.sh
iptables -t nat -L POSTROUTING -n -v --line-numbers
