#!/bin/bash

Help(){
echo "----------------------------"
echo "Valid options:"
echo "-c for user count"
echo "-d for disabled accounts"
echo "----------------------------"
}

if [ "$1" == "-d" ]
then
cat /etc/shadow | awk -F: '$2 == "!" || $2 == "*" {print $1}'
elif [ "$1" == "-c" ]
then
while IFS= read -r user; do
loginCount=$(last | cut -c 1-8 | grep -c "$user")
echo "Login count for $user: $loginCount"
done < "usr.txt"
else
Help
fi
