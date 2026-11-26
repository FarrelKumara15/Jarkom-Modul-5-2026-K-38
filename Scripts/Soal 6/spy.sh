#!/bin/sh
cat > /etc/network/interfaces << 'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.230.4.102
    netmask 255.255.255.252
    gateway 192.230.4.101
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF
ifdown eth0 2>/dev/null || true
ifup eth0
ip -br a
ip route
