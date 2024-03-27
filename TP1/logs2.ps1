# Retrieve all entries from the System event log
Get-EventLog -LogName System | 
# Filter the entries to only include those where the source is "user32" and the event ID is 1074
Where-Object { $_.Source -eq "user32" -and $_.EventID -eq 1074 } |
# Select the time the event was generated and the message of the event
Select-Object TimeGenerated, Message |
# Export the results to a CSV file, without including type information in the file
Export-CSV -Path shutdown.csv -NoTypeInformation

## The event ID 1074 corresponds to a system shutdown