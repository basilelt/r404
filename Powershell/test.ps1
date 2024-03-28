# This is a test PowerShell script

# Define your variables here
$variable1 = "Hello"
$variable2 = "World"

# Write output to the console
Write-Host "$variable1 $variable2!"

# Add your code here
# Perform a loop to display numbers from 1 to 10
for ($i = 1; $i -le 10; $i++) {
    Write-Host "Number: $i"
}

# Define a function to calculate the square of a number
function Square($number) {
    return $number * $number
}

# Call the Square function and display the result
$numberToSquare = 5
$squaredNumber = Square $numberToSquare
Write-Host "The square of $numberToSquare is $squaredNumber"
# End of the script