#!/bin/bash

SWCONFIG='/usr/lib/adquio/nanopi-duo/md-switch'

$SWCONFIG stop
$SWCONFIG start 802.1q
$SWCONFIG port tag 1 u
$SWCONFIG port pvid 1 1
$SWCONFIG port tag 2 u
$SWCONFIG port pvid 2 1
$SWCONFIG port tag 3 u
$SWCONFIG port pvid 3 1
$SWCONFIG port tag 4 u
$SWCONFIG port pvid 4 2
$SWCONFIG port tag 5 t
$SWCONFIG port pvid 5 1
$SWCONFIG vlan id 1 1
$SWCONFIG vlan active 1 y
$SWCONFIG vlan member 1 1 y
$SWCONFIG vlan member 1 2 y
$SWCONFIG vlan member 1 3 y
$SWCONFIG vlan member 1 5 y
$SWCONFIG vlan id 2 2
$SWCONFIG vlan active 2 y
$SWCONFIG vlan member 2 4 y
$SWCONFIG vlan member 2 5 y

