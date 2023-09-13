#!/bin/bash

ip=$(bash mybinaryip.bash)
pl=$(bash ipprefixlength.bash)
mask=$(bash mybinarymask.bash)

network=""

for i in {1..32}
do
	if [[ "${mask:$i:1}" -eq "1" && "${ip:$i:1}" -eq "1" ]];
	then
	network+=1;
	else
	network+=0;
	fi
done
echo "${network}"

