#!/bin/bash

read ip

ip1=${ip:0:8}
ip2=${ip:9:8}
ip3=${ip:16:8}
ip4=${ip:25:8}

ip1fix=$(echo "obase=10;ibase=2;$ip1" | bc)
ip2fix=$(echo "obase=10;ibase=2;$ip2" | bc)
ip3fix=$(echo "obase=10;ibase=2;$ip3" | bc)
ip4fix=$(echo "obase=10;ibase=2;$ip4" | bc)

echo "${ip1fix}"."${ip2fix}"."${ip3fix}"."${ip4fix}"

