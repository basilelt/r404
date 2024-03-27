# Prompt the user to enter the number of most recent errors they want to retrieve
$numberOfErrors = Read-Host -Prompt 'Enter the number of errors to retrieve'

# Get the specified number of most recent error entries from the System event log
Get-EventLog -LogName System -EntryType Error -Newest $numberOfErrors |
# Select the date (without time) and the message of each error
Select-Object @{n='Date';e={$_.TimeGenerated.Date}}, Message |
# Group the errors by date
Group-Object -Property Date |
# Select the date and the count of errors for that date
Select-Object Name, Count |
# Export the results to a CSV file, without including type information in the file
Export-CSV -Path errors.csv -NoTypeInformation