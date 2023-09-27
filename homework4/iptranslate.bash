#!/bin/bash

output_file="possibleips.txt"

input_file="ip_addresses.txt"
while IFS= read -r line; do
    decimal_ip=""
    for ((i = 0; i < 32; i += 8)); do
        binary_octet="${line:$i:8}"
        decimal_octet=$((2#"$binary_octet"))
        decimal_ip+="$decimal_octet."
    done
    decimal_ip=${decimal_ip%.}

    echo "$decimal_ip" >> "$output_file"
done < "$input_file"
