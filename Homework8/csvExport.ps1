Get-Eventlog -list
$readLog= Read-host -Prompt "Please select a log to review"
Get-Eventlog -logName $readLog -Newest 3 | Export-csv -NoTypeInformation -Path C:\users\champuser\Desktop\rep.csv
