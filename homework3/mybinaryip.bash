#!/bin/bash

ip=$(bash myshortip.bash)

#redfine break from spaces to dot, then read in the ip across 4 variables
IFS=. read ip1 ip2 ip3 ip4 <<< "$ip"

ip1binary=$(echo "obase=2;$ip1" | bc)
ip2binary=$(echo "obase=2;$ip2" | bc)
ip3binary=$(echo "obase=2;$ip3" | bc)
ip4binary=$(echo "obase=2;$ip4" | bc)

printf '%08d' "${ip1binary}"
printf '%08d' "${ip2binary}"
printf '%08d' "${ip3binary}"
printf '%08d' "${ip4binary}"
