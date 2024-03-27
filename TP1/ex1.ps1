Get-Command - Module Microsoft . PowerShell . LocalAccounts
Get-LocalUser
New-LocalUser test
Get-LocalGroupMember -Member "test"
Get-LocalGroup | ForEach-Object { if ((Get-LocalGroupMember -Group $_.Name -Member "test" -ErrorAction SilentlyContinue) -ne $null) { $_.Name } }
