#!/bin/sh
echo "Halo Casper 5000 dari Lilith"    | nc -w 3 192.230.4.58 5000; echo "exit=$?"
echo "Halo Balthasar 5000 dari Lilith" | nc -w 3 192.230.4.59 5000; echo "exit=$?"
echo "Halo Balthasar 5001 dari Lilith" | nc -w 3 192.230.4.59 5001; echo "exit=$?"
echo "Halo Melchior 5000 dari Lilith"  | nc -w 3 192.230.4.60 5000; echo "exit=$?"
