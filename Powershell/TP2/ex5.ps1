$disk = (Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'")
$size = $disk.Size
$free = $disk.FreeSpace
$used = $size - $free
$used