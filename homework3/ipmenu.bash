#!/bin/bash

echo "Hello Network Friend!"
while true
do
	printf "Please select an option:\n1. Get my IP\n2. Get my IP in binary\n3. Get my network mask in binary\n4. Get my network adress in binary\n5. Convert binary to an IP\n"
	read input
	if [ "$input" -eq "1" ]
	then
	$(bash myip.bash)
	elif [ "$input" -eq "2" ]
	then
	$(bash mybinaryip.bash)
	elif [ "$input" -eq "3" ]
	then
	$(bash mybinarymask.bash)
	elif [ "$input" -eq "4" ]
	then
	$(bash mynetwork.bash)
	elif [ "$input" -eq "5" ]
	then
	$(bash myconvertbin.bash)
	fi


done

