#!/usr/bin/env python3
"""Verifikasi perhitungan VLSM (17 LAN + 16 Link) dan CIDR Summarization - Kelompok K-38 (192.230.0.0/16)."""
import ipaddress

lans = [
    (1, "Switch-Quarters", "Rei", [("Quarters", 500)]),
    (2, "Switch-Comm", "Hikari", [("Comm-Net", 200)]),
    (3, "Switch-Hangar", "Yui", [("Hangar-Crew", 100)]),
    (4, "Switch-Bunker", "Kensuke", [("Sachiel", 55)]),
    (5, "Switch-Medic", "Maya", [("Pen-Pen", 1), ("Medic-Bay", 25)]),
    (6, "Switch-Relay", "Kaworu", [("Relay-Node", 25)]),
    (7, "Switch-Garden", "Shinji", [("Garden-Staff", 14)]),
    (8, "Switch-Dock", "Mari", [("Dock-Crew", 12)]),
    (9, "Switch-Lab", "Ritsuko", [("Entry-Plug", 3), ("Dummy-Plug", 2)]),
    (10, "Switch-Terminal", "Fuyutsuki", [("Magi-Casper", 1), ("Magi-Balthasar", 1), ("Magi-Melchior", 1)]),
    (11, "Switch-Cage", "Misato", [("Unit-01", 1), ("Unit-02", 1), ("Unit-00", 1)]),
    (12, "Switch-Dogma", "Toji", [("Lilith", 1), ("Adam", 1)]),
    (13, "Switch-Monolith", "Shigeru", [("Zeruel", 1), ("Armisael", 1)]),
    (14, "Switch-Radar", "Makoto", [("Radar-Array", 4)]),
    (15, "Switch-Archive", "Asuka", [("Archive-Vault", 1)]),
    (16, "Switch-Intel", "Kaji", [("Spy", 1)]),
    (17, "Switch-Cmd", "Gendou", [("Tokyo3-Core", 1)]),
]

links = [
    ("Link Gendou-Yui", "Gendou", "Yui"),
    ("Link Gendou-Hikari", "Gendou", "Hikari"),
    ("Link Gendou-Asuka", "Gendou", "Asuka"),
    ("Link Gendou-Kaji", "Gendou", "Kaji"),
    ("Link Gendou-Misato", "Gendou", "Misato"),
    ("Link Gendou-Shigeru", "Gendou", "Shigeru"),
    ("Link Gendou-Fuyutsuki", "Gendou", "Fuyutsuki"),
    ("Link Yui-Rei", "Yui", "Rei"),
    ("Link Yui-Shinji", "Yui", "Shinji"),
    ("Link Yui-Mari", "Yui", "Mari"),
    ("Link Hikari-Kaworu", "Hikari", "Kaworu"),
    ("Link Asuka-Kensuke", "Asuka", "Kensuke"),
    ("Link Asuka-Ritsuko", "Asuka", "Ritsuko"),
    ("Link Fuyutsuki-Maya", "Fuyutsuki", "Maya"),
    ("Link Fuyutsuki-Toji", "Fuyutsuki", "Toji"),
    ("Link Shigeru-Makoto", "Shigeru", "Makoto"),
]

cur = int(ipaddress.IPv4Address("192.230.0.0"))
for no, sw, gw, hosts in lans:
    usable_needed = sum(c for _, c in hosts) + 1
    bits = 0
    while (1 << bits) - 2 < usable_needed:
        bits += 1
    net = ipaddress.IPv4Network((cur, 32 - bits))
    ips = list(net.hosts())
    print(f"{no:2d} | {sw:20s} | {str(net):18s} | GW={ips[0]} | BC={net.broadcast_address} | Used={usable_needed} | Sisa={(1<<bits)-2-usable_needed}")
    cur += (1 << bits)

for idx, (name, a, b) in enumerate(links, 18):
    net = ipaddress.IPv4Network((cur, 30))
    ips = list(net.hosts())
    print(f"{idx:2d} | {name:20s} | {str(net):18s} | {a}={ips[0]}, {b}={ips[1]} | BC={net.broadcast_address} | Used=2 | Sisa=0")
    cur += 4
