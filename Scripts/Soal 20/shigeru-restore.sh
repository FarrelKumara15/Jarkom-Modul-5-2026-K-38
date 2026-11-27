#!/bin/bash

ip route replace default via 192.230.4.129 dev eth0
ip route replace 192.230.4.88/29 via 192.230.4.170 dev eth2
