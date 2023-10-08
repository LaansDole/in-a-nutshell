function Elevate-Admin {
    param(
        [string]$WindowsDefinition = "Elevated",
        [System.ConsoleColor]$PromptBackGroundColor = $Host.UI.RawUI.BackgroundColor,
        [System.ConsoleColor]$PromptForeGroundColor = $Host.UI.RawUI.ForegroundColor,
        [System.ConsoleColor]$HintBackgroundColor = $Host.UI.RawUI.BackgroundColor,
        [System.ConsoleColor]$HintForeGroundColor = [System.ConsoleColor]::Yellow
    )
    # Check if running as an administrator
    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        # Not running as an administrator, so relaunch as administrator
        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
        exit
    }
    Write-Host "Running with elevated privileges."
    # We are running as an administrator, so change the title and background colour to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + $WindowsDefinition;
    # $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
}