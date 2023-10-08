# Windows Update and RSAT Component Installation

This PowerShell script performs two main tasks: installing the latest Windows update and checking the installation of various RSAT components.

## Install the Latest Windows Update

The script first prompts the user to decide whether to install the latest Windows update. If the user inputs 'n', the script will proceed with the installation using the `PSWindowsUpdate` module.

```powershell
Write-Host "Windows Latest Update Installing..." -ForegroundColor Yellow -BackgroundColor DarkGreen
$windowsUpdate = Read-HostWithTimeout -Timeout 5 -Prompt "Do you want to skip install the latest windows update?
                            `nPress any keys to skip, 'n' to install: " -TimeoutHint "Skip"

if ($windowsUpdate -eq 'n') {
    Install-Module PSWindowsUpdate
    Install-WindowsUpdate -AcceptAll -Install
}
```

## Check RSAT Component

The script then checks and installs various RSAT components if they are not already installed. The RSAT components checked are:

1. Server Manager
2. Active Directory Certificate Services
3. Active Directory Domain Servers and Lightweight Directory Services Tools

For each component, the script checks if it is installed using `Get-WindowsCapability`. If not installed, it uses `Add-WindowsCapability` to install it.

```powershell
# Check and Install RSAT: Server Manager - Dependencies
$feature = "Rsat.ServerManager.Tools~~~~0.0.1.0"
$installed = Get-WindowsCapability -Name $feature -Online | Select-Object -Property State

if ($installed.State -eq "Installed") {
    Write-Host "RSAT: Server Manager is already installed" -ForegroundColor Yellow -BackgroundColor DarkGreen
} else {
    Write-Host "RSAT: Server Manager will be now installed" -ForegroundColor Yellow
    Add-WindowsCapability -Online -Name $feature
}
```

The same process is repeated for other RSAT components.

## Why RSAT
Remote Server Administration Tools (RSAT) are essential for system administrators as they provide the ability to manage Windows features remotely.

1. **Remote Management**: RSAT enables system and network administrators to run snap-ins and tools on remote servers, thereby managing roles and role services. This can include managing Group Policy.

2. **Best Practices**: As a Windows Systems Administrator, it's best practice to avoid logging on directly to servers to administer them. Installing RSAT tools in Windows 10 offers you the tools you need to manage your servers right from Windows 10. This reduces overhead and introduces best practices and security measures in protecting the domain controller.

3. **Versatility**: RSAT can be installed only on computers that are running the full release of Windows 10 Professional, Windows 10 Enterprise, or Windows 10 Education. It provides a unique tool that allows you to manage many aspects of Microsoft Server technologies remotely (from your personal computer).

# Get-Computer Function

The `Get-Computer` function is a PowerShell script that retrieves and displays information about the current computer from Active Directory (AD).

## Functionality

The function performs the following steps:

1. **Get User Credentials**: The function prompts the user to input their username. It then uses these credentials to interact with AD.

    ```powershell
    do {
        $username = Read-Host "Input your username"
    } 
    while ($username.Length -eq 0)
    $username = $username.ToUpper()
    $credentials = Get-Credential -Message "Use your PAM/MGR account: " -UserName $username
    ```

2. **Retrieve Computer Information**: The function attempts to retrieve information about the current computer from AD using the `Get-ADComputer` cmdlet. If an error occurs (likely due to incorrect credentials), it prompts the user to try again.

    ```powershell
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
    ```

3. **Display Computer Information**: If the computer information was successfully retrieved, it checks if the computer name is null. If it is, it means that the device is not on AD and it informs the user about this. Otherwise, it informs the user that the computer is on AD.

    ```powershell
    $computername = $computerObject.Name

    if ( $computername -eq $null ) {
        Write-Host "Your Device $env:COMPUTERNAME is not on AD" -ForegroundColor White -BackgroundColor Red
        Read-HostWithTimeout -Timeout 5
        exit
    }
    Write-Host "`n$computername is on AD`n" -ForegroundColor Yellow -BackgroundColor DarkGreen
    ```

## Usage

This function can be used by system administrators to quickly check if a device is registered on Active Directory.

