#!/bin/bash

localip=192.168.0.0/24
vpnip=$1
protocol=udp
port=1194

iptables --flush
iptables --delete-chain
iptables -t nat --flush
iptables -t nat --delete-chain
iptables -P OUTPUT DROP
iptables -A INPUT -j ACCEPT -i lo
iptables -A OUTPUT -j ACCEPT -o lo
iptables -A INPUT --src $localip -j ACCEPT -i wlp2s0
iptables -A OUTPUT -d $localip -j ACCEPT -o wlp2s0
iptables -A OUTPUT -j ACCEPT -d $vpnip -o wlp2s0 -p $protocol -m $protocol --dport $port
iptables -A INPUT -j ACCEPT -s $vpnip -i wlp2s0 -p $protocol -m $protocol --sport $port
iptables -A INPUT -j ACCEPT -i tun0
iptables -A OUTPUT -j ACCEPT -o tun0
