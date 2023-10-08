function SaveUserInfoToFile {
    param (
        [string]$UserInfoVN,
        [string]$UserInfoAU,
        [string]$UserName,
        [string]$directoryPath = "C:\\Documents\\UserInfoLog\\"
    )

    # Check if the directory exists
    if (-not (Test-Path -Path $directoryPath)) {
        # If not, create it
        New-Item -ItemType Directory -Path $directoryPath | Out-Null
    }
    
    # Get the current timestamp
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

    # Define the file path
    $filePath = Join-Path -Path $directoryPath -ChildPath ("UserInfo_" + $UserName + "_" + $timestamp + ".txt")

    # Save the information to a file in the specified directory
    "AD VN`n" + $UserInfoVN + "`nAD AU `n" + $UserInfoAU | Out-File -FilePath $filePath -Append
    Write-Host "`n`nUser info saved to $filePath`n" -ForegroundColor Yellow
}