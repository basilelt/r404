$choice = Read-Host "Print result (1) or store it to csv (2)"
if ($choice -eq 1) {
    Test-Connection -ComputerName $args[0]

} elseif ($choice -eq 2) {
    Test-Connection -ComputerName $args[0] | Export-Csv -Path "output.csv"
} else {
    Write-Host "Invalid choice"
}