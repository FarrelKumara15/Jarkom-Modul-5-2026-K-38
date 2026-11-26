#!/bin/sh
nc -w 3 192.230.3.194 80; echo "exit=$?"
nc -w 3 192.230.4.106 80; echo "exit=$?"
nc -w 3 192.230.4.106 8080; echo "exit=$?"
time nc -w 3 192.230.3.194 22; echo "exit=$?"
time nc -w 3 192.230.4.106 22; echo "exit=$?"
