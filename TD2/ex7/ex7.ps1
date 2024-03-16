# Set the DebugPreference variable to 'Continue' to display debug messages
$DebugPreference = 'Continue'
$VerbosePreference = 'Continue'

$response = Invoke-WebRequest -Uri "https://learn.microsoft.com/fr-fr/previous-versions/windows/powershell-scripting/hh847746(v=wps.640)?redirectedfrom=MSDN"

# Get the HTML
$html = $response | Select-Object -ExpandProperty Content

# Extract the <pre> block
$preBlock = $html | Select-String -Pattern '(?s)<pre.*?>(.*?)</pre>' -AllMatches | ForEach-Object { $_.Matches }

# Decode the character entities
$decodedBlock = [System.Net.WebUtility]::HtmlDecode($preBlock.Value)

# Split the block into lines
$lines = $decodedBlock -split "`n"

# Initialize a hashtable to store the counts
$operatorCounts = @{}

# Count the occurrences of each operator
foreach ($line in $lines) {
    if ($line -match '^\s*([0-9]*[>&*]+[0-9]*)\s') {
        $operator = $Matches[1]
        if (-not $operatorCounts.ContainsKey($operator)) {
            $operatorCounts[$operator] = 1
        }
    }
}

# Output the counts
$operatorCounts.Keys.Count

# Output the counts
#$operatorCounts

