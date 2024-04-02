$disks = Get-WmiObject -Class Win32_LogicalDisk
foreach ($disk in $disks) {
    $size = $disk.Size
    $free = $disk.FreeSpace
    # Vérifier si la taille du disque est non nulle et supérieure à zéro
    if ($size -ne $null -and $size -gt 0) {
        $used = $size - $free
        $percent = ($used / $size) * 100
        # Afficher l'identifiant du disque et le pourcentage d'espace utilisé, formaté à deux décimales
        "{0} {1:N2}%" -f $disk.DeviceID, $percent
    } else {
        # Si la taille du disque est nulle ou zéro, afficher un message indiquant que la taille n'est pas disponible
        "{0} {1}" -f $disk.DeviceID, "Size not available"
    }
}