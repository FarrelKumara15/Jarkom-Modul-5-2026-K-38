#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

# Cabang Yui (via 192.230.4.110)
ip route replace 192.230.0.0/23   via 192.230.4.110
ip route replace 192.230.3.0/25   via 192.230.4.110
ip route replace 192.230.4.0/27   via 192.230.4.110
ip route replace 192.230.4.32/28  via 192.230.4.110
ip route replace 192.230.4.136/29 via 192.230.4.110  # Summary: Yui-Rei + Yui-Shinji
ip route replace 192.230.4.144/30 via 192.230.4.110

# Cabang Hikari (via 192.230.4.114)
ip route replace 192.230.2.0/24   via 192.230.4.114
ip route replace 192.230.3.224/27 via 192.230.4.114
ip route replace 192.230.4.148/30 via 192.230.4.114

# Cabang Asuka (via 192.230.4.118)
ip route replace 192.230.3.128/26 via 192.230.4.118
ip route replace 192.230.4.48/29  via 192.230.4.118
ip route replace 192.230.4.96/30  via 192.230.4.118
ip route replace 192.230.4.152/29 via 192.230.4.118  # Summary: Asuka-Kensuke + Asuka-Ritsuko

# Cabang Kaji & Misato
ip route replace 192.230.4.100/30 via 192.230.4.122
ip route replace 192.230.4.64/29  via 192.230.4.126

# Cabang Shigeru (via 192.230.4.130)
ip route replace 192.230.4.80/28  via 192.230.4.130  # Summary: Switch-Monolith + Switch-Radar
ip route replace 192.230.4.168/30 via 192.230.4.130

# Cabang Fuyutsuki (via 192.230.4.134)
ip route replace 192.230.3.192/27 via 192.230.4.134
ip route replace 192.230.4.56/29  via 192.230.4.134
ip route replace 192.230.4.72/29  via 192.230.4.134
ip route replace 192.230.4.160/29 via 192.230.4.134  # Summary: Fuyutsuki-Maya + Fuyutsuki-Toji
