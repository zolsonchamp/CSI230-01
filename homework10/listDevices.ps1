$validOptions = @('all', 'stopped', 'running', 'quit')

do {
    Write-Host "Choose an option:"
    Write-Host "1. List all services"
    Write-Host "2. List running services"
    Write-Host "3. List stopped services"
    Write-Host "4. Quit"
    
    $choice = Read-Host "Enter your choice (1/2/3/4)"
    
    switch ($choice) {
        '1' {
            $services = Get-Service
            Write-Host "All Services:"
            $services | Format-Table -AutoSize
        }
        '2' {
            $services = Get-Service | Where-Object { $_.Status -eq 'Running' }
            Write-Host "Running Services:"
            $services | Format-Table -AutoSize
        }
        '3' {
            $services = Get-Service | Where-Object { $_.Status -eq 'Stopped' }
            Write-Host "Stopped Services:"
            $services | Format-Table -AutoSize
        }
        '4' {
            Write-Host "Exiting the program."
            break 2
        }
        default {
            if ($choice -in $validOptions) {
                Write-Host "Invalid option. Please select a valid option."
            } else {
                Write-Host "Invalid input. Please enter a valid option (1/2/3/4)."
            }
        }
    }
    Read-Host "Press Enter to continue..."
} while ($true)
