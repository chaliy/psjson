Import-Module .\PsJson\PsJson.psm1 -Force
Import-Module PsUrl

#Get-WebContent "https://api.github.com/users/chaliy/repos" | Format-Json

Get-Content example.json | Format-Json
