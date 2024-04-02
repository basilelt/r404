$user = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName
$name = (Get-WmiObject -Class Win32_Desktop | Where-Object { $_.Name.EndsWith($user) }).Name.Split('\')[0]
$os = (Get-WmiObject -Class Win32_OperatingSystem).Caption
$version = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty Version


# La requête "SELECT * FROM SoftwareLicensingService" récupère toutes les informations de la classe SoftwareLicensingService
# La propriété OA3xOriginalProductKey de cette classe contient la clé de produit du système d'exploitation
$key = (Get-WmiObject -query "SELECT * FROM SoftwareLicensingService").OA3xOriginalProductKey

$data = New-Object PSObject -Property @{
    "Computer name" = $name
    "Operating system" = $os
    "Version" = $version
    "Product key" = $key
}
# NoTypeInformation permet de ne pas écrire le type des objets dans le fichier CSV
$data | Export-Csv -Path "output.csv" -NoTypeInformation