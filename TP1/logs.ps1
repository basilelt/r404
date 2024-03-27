Get-EventLog -List
Get-EventLog -LogName System | Select-Object Index, Time, EntryType, Source, InstanceID, Message -Unique | Format-Table
