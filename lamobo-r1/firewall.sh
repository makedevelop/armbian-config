#!/bin/bash

IPTABLES='/sbin/iptables'    
    
echo '1' > /proc/sys/net/ipv4/ip_forward    
    
$IPTABLES -F    
$IPTABLES -F -t nat    
    
$IPTABLES -P INPUT DROP    
$IPTABLES -P OUTPUT ACCEPT    
$IPTABLES -P FORWARD DROP    
    
$IPTABLES -A INPUT -i lo -j ACCEPT    
$IPTABLES -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT    
$IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT    
    
$IPTABLES -A INPUT -i br-lan -j ACCEPT    
    
$IPTABLES -A INPUT -i br-wan -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT

$IPTABLES -A FORWARD -i br-lan -o br-wan -j ACCEPT
$IPTABLES -A FORWARD -i br-wan -o br-lan -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o br-wan -j MASQUERADE

