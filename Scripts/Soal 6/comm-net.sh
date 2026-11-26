#!/bin/sh
cat > /etc/network/interfaces << 'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.230.2.2
    netmask 255.255.255.0
    gateway 192.230.2.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF
ifdown eth0 2>/dev/null || true
ifup eth0
ip -br a
ip route
