#!/bin/bash

logFile="allAccessLogs.txt"
htmlOutput="accessLogs.html"

echo "<html>" > $htmlOutput
echo "<body>" >> $htmlOutput
echo "<table border='1'>" >> $htmlOutput
echo "<tr><th>IP</th>Time</th><th>Requested Page</th><th>User Agent</th></tr>" >> $htmlOutput

while read -r line;
do
ip=$(echo "$line" | awk '{print $1}')
time=$(echo "$line" | awk -F "[" '{print $2}' | awk -F "]" '{print $1}')
requestedPage=$(echo "$line" | awk -F '"' '{print $2}')
userAgent=$(echo "$line" | awk -F '"' '{print $6}')

echo "<tr><td>$ip</td><td>$time</td><td>$requestedPage</td><td>$userAgent</td></tr>" >> $htmlOutput
done < $logFile

echo "</table>" >> $htmlOutput
echo "</body>" >> $htmlOutput
echo "</html>" >> $htmlOutput
