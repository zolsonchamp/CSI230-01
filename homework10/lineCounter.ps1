$DirectoryToSearch = "C:\Users\champuser\CSI230-01"

$FilesToLookAt = Get-ChildItem -Path $DirectoryToSearch -Recurse -Filter "*.bash"

$results = @()

foreach ($file in $FilesToLookAt) {
    $content = Get-Content $file.FullName
    $lineCount = ($content | Measure-Object -Line).Lines
    $wordCount = ($content | Measure-Object -Word).Words

    $results += [PSCustomObject]@{
        Folder = $file.DirectoryName
        FileName = $file.Name
        LineCount = $lineCount
        WordCount = $wordCount
    }
}

$averageLineCount = ($results | Measure-Object -Average LineCount).Average
$maxLineCount = ($results | Measure-Object -Maximum LineCount).Maximum
$minLineCount = ($results | Measure-Object -Minimum LineCount).Minimum

$averageWordCount = ($results | Measure-Object -Average WordCount).Average
$maxWordCount = ($results | Measure-Object -Maximum WordCount).Maximum
$minWordCount = ($results | Measure-Object -Minimum WordCount).Minimum

$results | Format-Table -AutoSize

# Display the summary statistics
Write-Host "Average Line Count: $averageLineCount"
Write-Host "Maximum Line Count: $maxLineCount"
Write-Host "Minimum Line Count: $minLineCount"
Write-Host "Average Word Count: $averageWordCount"
Write-Host "Maximum Word Count: $maxWordCount"
Write-Host "Minimum Word Count: $minWordCount"