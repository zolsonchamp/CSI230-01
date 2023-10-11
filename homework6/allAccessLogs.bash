#!/bin/bash

logDirectory="/var/log/apache2"
outputFile="allAccessLogs.txt"

cat ${logDirectory}/access.log* > ${outputFile}
