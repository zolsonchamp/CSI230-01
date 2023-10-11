#!/bin/bash

logDirectory="../var/log/apache2"
outputFile="allAcessLogs.bash"

cat ${logDirectory}/access.log* > ${outputFile}
