function Get-Computer {
    # Get user credentials
    do {
        $username = Read-Host "Input your username"
    } 
    while ($username.Length -eq 0)
    $username = $username.ToUpper()
    $credentials = Get-Credential -Message "Use your PAM/MGR account: " -UserName $username
    do {
        try {
            $isError = $false
            $computerObject = Get-ADComputer $env:COMPUTERNAME -Properties * -Credential $credentials | Select *
        } catch {
            Read-HostWithTimeout -Timeout 2 -Prompt "Incorrect Credential, try again" -PromptForeGroundColor White -PromptBackGroundColor Red
            $isError = $true
            continue
        }
    }
    while ($isError)

    $computername = $computerObject.Name

    if ( $computername -eq $null ) {
        Write-Host "Your Device $env:COMPUTERNAME is not on AD" -ForegroundColor White -BackgroundColor Red
        Read-HostWithTimeout -Timeout 5
        exit
    }
    Write-Host "`n$computername is on AD`n" -ForegroundColor Yellow -BackgroundColor DarkGreen
}