#!/bin/bash

ip link add link eth0 name eth0.101 type vlan id 101
ip link set eth0.101 up
ip link add link eth0 name eth0.102 type vlan id 102
ip link set eth0.102 up
ip link add link eth0 name eth0.103 type vlan id 103
ip link set eth0.103 up
ip link add link eth0 name eth0.104 type vlan id 104
ip link set eth0.104 up
ip link add link eth0 name eth0.105 type vlan id 105
ip link set eth0.105 up

ip link add br-wan type bridge
ip link add br-lan type bridge

ip link set wan master br-wan
ip link set lan1 master br-lan
ip link set lan2 master br-lan
ip link set lan3 master br-lan
ip link set lan4 master br-lan

bridge vlan add vid 101 dev lan1 pvid untagged
bridge vlan del dev lan1 vid 1 self
bridge vlan del dev lan1 vid 1 master
bridge vlan add vid 102 dev lan2 pvid untagged
bridge vlan del dev lan2 vid 1 self
bridge vlan del dev lan2 vid 1 master
bridge vlan add vid 103 dev lan3 pvid untagged
bridge vlan del dev lan3 vid 1 self
bridge vlan del dev lan3 vid 1 master
bridge vlan add vid 104 dev lan4 pvid untagged
bridge vlan del dev lan4 vid 1 self
bridge vlan del dev lan4 vid 1 master
bridge vlan add vid 105 dev wan pvid untagged
bridge vlan del dev wan vid 1 self
bridge vlan del dev wan vid 1 master

ip link set eth0.101 master br-lan
ip link set eth0.102 master br-lan
ip link set eth0.103 master br-lan
ip link set eth0.104 master br-lan
ip link set eth0.105 master br-wan

ip link set lan1 up
ip link set lan2 up
ip link set lan3 up
ip link set lan4 up
ip link set wan up
