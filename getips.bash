#! /bin/bash

input="/var/log/apache2/access.log"

currentDate=$(date +"%d/%b/%Y")

grep "$currentDate" "$input" | awk '{print $1}'| sort | uniq -c
