#! /bin/bash

userChoice="-1"


function listIps ()
{
input="/var/log/apache2/access.log"
< "$input" cut -d ' ' -f 1 | sort | uniq >> clientIps.txt
}

function visitors () 
{
currentDate=$(date +"%d/%b/%Y")
grep "$currentDate" "$input" | awk '{print $1}'| sort | uniq -c
}

function badClients ()
{
time_range=$(date -d 'now - 10 minutes' '+%d/%b/%Y:%H:%M:%S')
badRequest=$(grep "$currentDate" "$input" | awk '$9 ~/^(404|403|400)$/ {print $1}' | sort | uniq -c)

while read -r line;
do
	count=$(echo "$line" | awk '{print $1}')
	ip=$(echo "$line" | awk '{print $2}')

	if [ "$count" -ge 3 ]
	then
		"$ip" >> blacklist.txt
	fi
done < "$badRequest"
}
while [ "$userChoice" != "7" ];
do
	printf "Please select an option:\n1. Get Number of Visitors\n2. Display Visitors\n3. Show Bad Visits\n4. Block Bad Visits\n5. Reset Block Rules\n6. Show Visit Histogram\n7. Quit\n"
	read userChoice
	if [ "$userChoice" == "1" ]
	then
		listIps
	elif [ "$userChoice" == "2" ]
	then
		visitors
	elif [ "$userChoice" == "3" ]
	then
		badClients
	elif [ "$userChoice" == "7" ]
	then
		break;
	else
		printf "Not a valid option\n"
	fi

done

