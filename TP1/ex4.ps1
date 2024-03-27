# Retrieve all local users
Get-LocalUser | 
# Filter the users to only include those who have logged on within the last 3600 days
Where-Object {$_.Lastlogon -ge (Get-Date).AddDays(-3600)} | 
# Select the name and last logon time of each user
Select-Object Name,Lastlogon | 
# Format the results as a list
Format-List