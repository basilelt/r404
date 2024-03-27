# Define parameters for the script: a user name and a group name
param (
    # If the 'User' parameter set is used, the user name is mandatory
    [Parameter(ParameterSetName='User', Mandatory=$true)]
    [string]$u,

    # If the 'Group' parameter set is used, the group name is mandatory
    [Parameter(ParameterSetName='Group', Mandatory=$true)]
    [string]$g
)

# If a user name was provided
if ($u) {
    # Retrieve the local user with the specified name
    $user = Get-LocalUser | Where-Object { $_.Name -eq $u }
    # If the user exists
    if ($user) {
        # Output a message stating that the user exists
        Write-Host "User $u exists."
    } else {
        # Output a message stating that the user does not exist
        Write-Host "User $u does not exist."
    }
# If a group name was provided
} elseif ($g) {
    # Retrieve the local group with the specified name
    $group = Get-LocalGroup | Where-Object { $_.Name -eq $g }
    # If the group exists
    if ($group) {
        # Output a message stating that the group exists
        Write-Host "Group $g exists."
    } else {
        # Output a message stating that the group does not exist
        Write-Host "Group $g does not exist."
    }
}