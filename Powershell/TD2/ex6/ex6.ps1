$files = Get-ChildItem -Path .\test
$newExtension = 0

foreach ($file in $files) {
    $newExtension++
    $newExtensionString = $newExtension.ToString()
    $newName = "{0}.{1}" -f $file.BaseName, $newExtensionString
    Rename-Item -Path $file.FullName -NewName $newName
}