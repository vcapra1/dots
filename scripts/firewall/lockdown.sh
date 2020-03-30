#!/bin/sh

iptables -F
iptables -X

iptables-restore < ipv4-lockdown
ip6tables-restore < ipv6-lockdown

iptables-save | sudo tee /etc/iptables/iptables.rules
ip6tables-save | sudo tee /etc/iptables/ip6tables.rules
