#!/bin/bash

ip route replace default via 192.230.4.133 dev eth0
ip route replace 192.230.3.192/27 via 192.230.4.162 dev eth2
ip route replace 192.230.4.72/29 via 192.230.4.166 dev eth3
