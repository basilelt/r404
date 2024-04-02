Get-CimInstance -ClassName <NameClass>
Get-CimInstance *

Get-WmiObject -List

Get-CimClass
(Get-CimClass | Measure-Object).Count


Get-WmiObject -List
Get-WmiObject -List | Measure-Object

Get-WmiObject -Class Win32_LogicalDisk > output.txt

(Get-WmiObject -Class Win32_LogicalDisk).Count

Get-WmiObject -Class Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapter-ComputerName "server"
Test-Connection -ComputerName "server"
Test-Connection -ComputerName "server" -Quiet