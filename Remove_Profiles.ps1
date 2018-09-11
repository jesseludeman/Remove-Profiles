function Remove-Profiles()
{


    # Profiles to keep
    $ProfilesToKeep = @("C:\Users\Administrator", "C:\Users\Default", "C:\Users\Public")
    
    # Get a computer name
    $Computer = Read-Host "Enter a computer name"

    # List local profiles excluding administrator accounts
    $Profiles = Get-WmiObject -Class Win32_UserProfile -ComputerName $Computer | Where-Object {$_.localpath -notin $ProfilesToKeep}

    # Remove the object
    if ($Profiles -ne $null)
    {
        $Profiles | Remove-WmiObject
    }


}