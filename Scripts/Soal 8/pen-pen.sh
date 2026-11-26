#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.conf
rm -f /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources
cat << 'REPO' > /etc/apt/sources.list.d/debian.sources
Types: deb
URIs: http://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
REPO
which nc.traditional >/dev/null 2>&1 || (apt-get update && apt-get install -y ifupdown iptables netcat-traditional)

cat << 'INNER' > /root/reply_80.sh
#!/bin/sh
echo "Welcome to $(hostname)"
INNER
chmod +x /root/reply_80.sh

pkill -f "nc.traditional -l -p 80 " 2>/dev/null || true
nohup bash -c 'while true; do nc.traditional -l -p 80 -e /root/reply_80.sh; done' >/dev/null 2>&1 &
