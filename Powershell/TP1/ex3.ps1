# Start a loop that will continue until a non-empty username is entered
do {
    # Prompt the user to enter a username
    $user = Read-Host -Prompt "Enter username"
    # If the username is empty
    if ($user -eq "") {
        # Output a message stating that the username cannot be empty
        Write-Host "Username cannot be empty"
    }
# Continue the loop as long as the username is empty
} while ($user -eq "")

# Start a loop that will continue until a non-empty password is entered
do {
    # Prompt the user to enter a password and store it as a secure string
    $pass = Read-Host -Prompt "Enter password" -AsSecureString
    # Convert the secure string to a plain text string
    $plainPass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
    # If the password is empty
    if ($plainPass -eq "") {
        # Output a message stating that the password cannot be empty
        Write-Host "Password cannot be empty"
    }
# Continue the loop as long as the password is empty
} while ($plainPass -eq "")

# Create a new local user with the entered username and password
New-LocalUser $user -Password $pass
# Add the new user to the "Utilisateurs" group
Add-LocalGroupMember -Group "Utilisateurs" -Member $user