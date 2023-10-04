#!/bin/bash

inputFile="activeHosts.txt"
outputFile="webServers.txt"

while IFS= read ip;
do
local ip="$1"
local responceCode=$(curl -s -o /dev/null -w "%{http_code}" http://${ip})
if [ "$responceCode" -eq 200 ];
then
echo "$ip" >> "$outputFile"
fi
done < "$inputFile"
