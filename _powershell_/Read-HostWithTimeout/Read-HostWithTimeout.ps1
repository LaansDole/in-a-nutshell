# Custom Read-Host but with Timeout to reduce manual actions
function Read-HostWithTimeout {
    param(
        [string]$Prompt = "Press any keys to continue... ",
        [System.ConsoleColor]$PromptBackGroundColor = $Host.UI.RawUI.BackgroundColor,
        [System.ConsoleColor]$PromptForeGroundColor = $Host.UI.RawUI.ForegroundColor,
        [int]$Timeout = 5,
        [string]$TimeoutHint = "Timeout",
        [System.ConsoleColor]$HintBackgroundColor = $Host.UI.RawUI.BackgroundColor,
        [System.ConsoleColor]$HintForeGroundColor = [System.ConsoleColor]::Yellow
    )

    # Timeout runs in second = 1000ms
    $Timeout = $Timeout*1000

    Write-Host $Prompt -ForegroundColor $PromptForeGroundColor -BackgroundColor $PromptBackGroundColor -NoNewline

    $res = try {
        $ErrorActionPreference = 'Stop'
        powershell.exe -Command {
            param($Timeout)
            $InitialSessionState = [initialsessionstate]::CreateDefault()
            $InitialSessionState.Variables.Add(
                [System.Management.Automation.Runspaces.SessionStateVariableEntry]::new(
                    "ThreadContext",
                    @{Host = $Host },
                    "share host between threads"
                )
            )
            $PSThread = [powershell]::Create($InitialSessionState)
            $null = $PSThread.AddScript{
                $ThreadContext.Host.UI.ReadLine()
            }
            $Job = $PSThread.BeginInvoke()
            if (-not $Job.AsyncWaitHandle.WaitOne($Timeout)) {
                Get-Process -Id $PID | Stop-Process
            }
            else {
                return $PSThread.EndInvoke($Job)
            }
        } -args $Timeout
    }
    catch {
        Write-Host $TimeoutHint -ForegroundColor $HintForeGroundColor -BackgroundColor $HintBackGroundColor
    }
    return $res
}