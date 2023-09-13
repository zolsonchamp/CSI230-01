#!/bin/bash

ip=$(bash myip.bash | awk '{ print substr( $0, 1, length($0)-3 ) }')
echo "${ip}"
