#!/bin/sh
# IP sementara untuk node uji Soal 3-5 (jalankan perintah yang sesuai pada masing-masing console):

# [Armisael]
# ip addr replace 192.230.4.83/29 dev eth0 && ip link set eth0 up && ip route replace default via 192.230.4.81

# [Lilith]
# ip addr replace 192.230.4.74/29 dev eth0 && ip link set eth0 up && ip route replace default via 192.230.4.73

# [Sachiel]
# ip addr replace 192.230.3.130/26 dev eth0 && ip link set eth0 up && ip route replace default via 192.230.3.129

# [Comm-Net]
# ip addr replace 192.230.2.2/24 dev eth0 && ip link set eth0 up && ip route replace default via 192.230.2.1

# Uji dari Armisael:
# ping -c 3 -W 2 192.230.4.74
# ping -c 3 -W 2 192.230.3.130
# ping -c 3 -W 2 192.230.2.2
