#! /bin/bash

for i in {1..20}
do
curl 192.168.3.135/helloworld.html >nul 2>nul
done
echo "Acessed website ${i} times"
