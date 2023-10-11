#!/bin/bash


Help(){
echo "--------------------------------"
echo "Invalid Option"
echo "Valid Options:"
echo "-d List Disabled Accounts"
echo "-c Count Logins of a User"
echo "--------------------------------"
}

while getopts ":dc" option; do
case $option in
d)
cat /etc/shadow | awk -F: '$2 == "!" || $2 == "*" {print $1}'
;;
c)

;;
*)
Help
;;
esac
done
