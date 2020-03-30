#!/bin/sh

iptables -F
iptables -X

iptables-restore < ipv4
ip6tables-restore < ipv6

iptables-save | sudo tee /etc/iptables/iptables.rules
ip6tables-save | sudo tee /etc/iptables/ip6tables.rules
