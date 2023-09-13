#!/bin/bash

ip=$(bash myip.bash | awk '{ print substr ($0, 14 ) }')
echo "${ip}"
