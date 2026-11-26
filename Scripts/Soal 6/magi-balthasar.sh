#!/bin/bash
ip addr replace 192.230.4.59/29 dev eth0
ip link set eth0 up
ip route replace default via 192.230.4.57
echo "nameserver 8.8.8.8" > /etc/resolv.conf

rm -f /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources
cat << 'REPO' > /etc/apt/sources.list.d/debian.sources
Types: deb
URIs: http://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
REPO
apt-get update && apt-get install -y ifupdown iptables netcat-traditional

cat > /etc/network/interfaces << 'EOF'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.230.4.59
    netmask 255.255.255.248
    gateway 192.230.4.57
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF

ifdown eth0 2>/dev/null || true
ip addr flush dev eth0
mkdir -p /run/network
ifup eth0
ip -br a
ip route
