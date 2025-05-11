<#
.SYNOPSIS
Moves a specified file or folder to the Windows Recycle Bin or deletes it permanently WITHOUT PROMPTING.
Shows directory size changes for permanent deletions.

.DESCRIPTION
This script provides two methods to remove files or directories:
1. Recycle mode: Sends items to the Windows Recycle Bin (recoverable)
2. Permanent mode: Deletes items permanently with detailed size reporting before and after deletion

The script is designed to be called from WSL environments through a bash wrapper script,
but can also be used directly in PowerShell.

.PARAMETER Path
The full path to the file or folder to be removed. Can be a Windows path or WSL path converted to Windows format.

.PARAMETER Mode
Specifies whether to use 'Recycle' or 'Permanent' deletion mode.
- Recycle: Moves the item to the Recycle Bin
- Permanent: Permanently deletes the item with size reporting

.EXAMPLE
.\Smart-RemoveItem.ps1 -Path "C:\Users\username\Documents\old-file.txt" -Mode "Recycle"
Moves the specified file to the Windows Recycle Bin.

.EXAMPLE
.\Smart-RemoveItem.ps1 -Path "C:\Users\username\Documents\large-folder" -Mode "Permanent" 
Permanently deletes the specified folder and reports the size before and after deletion.
#>

param (
    [Parameter(Mandatory=$true, Position=0, HelpMessage="Enter the full path to the file or folder.")]
    [string]$Path,

    [Parameter(Mandatory=$true, Position=1, HelpMessage="Specify 'Recycle' or 'Permanent'.")]
    [ValidateSet("Recycle", "Permanent")]
    [string]$Mode
)

# Helper function to clean path for display (remove provider prefix)
function Get-CleanPathForDisplay {
    param([string]$FullPath)
    return $FullPath -replace "^Microsoft\.PowerShell\.Core\\FileSystem::", ""
}

# Helper function to get and format directory size
function Get-FormattedDirectorySize {
    param([string]$DirectoryPath)
    $cleanDirectoryPath = Get-CleanPathForDisplay -FullPath $DirectoryPath
    if (-not (Test-Path -Path $DirectoryPath -PathType Container)) {
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('CallingContext') -and $PSCmdlet.MyInvocation.BoundParameters['CallingContext'] -eq 'AfterDeleteTargetWasDirectory') {
            return "0 bytes (Directory deleted)"
        }
        return "N/A (Directory '$cleanDirectoryPath' not found or not accessible)"
    }
    try {
        $totalSize = (Get-ChildItem -Path $DirectoryPath -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
        if ($null -eq $totalSize) { $totalSize = 0 }
        return "{0:N0} bytes ({1:N2} MB)" -f $totalSize, ($totalSize / 1MB)
    } catch {
        return "N/A (Error calculating size for '$cleanDirectoryPath')"
    }
}

# Check if the path exists
if (-not (Test-Path -Path $Path -PathType Any)) {
    Write-Error "Error: The path '$(Get-CleanPathForDisplay -FullPath $Path)' does not exist or is not accessible."
    exit 1
}

$absolutePathObject = Resolve-Path -Path $Path -ErrorAction SilentlyContinue
if (-not $absolutePathObject) {
    Write-Error "Error: Could not resolve the path '$(Get-CleanPathForDisplay -FullPath $Path)'."
    exit 1
}
$targetPath = $absolutePathObject.ProviderPath # Use ProviderPath for operations, clean for display
$cleanTargetPathForDisplay = Get-CleanPathForDisplay -FullPath $targetPath

$isTargetFile = Test-Path -Path $targetPath -PathType Leaf
$isTargetContainer = Test-Path -Path $targetPath -PathType Container

# Action Logic
if ($Mode -eq "Permanent") {
    Write-Host "`n--- PowerShell: Permanent Deletion ---"
    $directoryToMonitor = ""
    $cleanDirectoryToMonitorForDisplay = ""
    $sizeBefore = ""
    $sizeAfter = ""

    if ($isTargetFile) {
        $directoryToMonitor = Split-Path -Path $targetPath -Parent
        $cleanDirectoryToMonitorForDisplay = Get-CleanPathForDisplay -FullPath $directoryToMonitor
        Write-Host "Target is a file. Monitoring parent directory: '$cleanDirectoryToMonitorForDisplay'"
        $sizeBefore = Get-FormattedDirectorySize -DirectoryPath $directoryToMonitor
        Write-Host "Size of parent dir BEFORE deletion: $sizeBefore"
    } elseif ($isTargetContainer) {
        $directoryToMonitor = $targetPath
        $cleanDirectoryToMonitorForDisplay = $cleanTargetPathForDisplay
        Write-Host "Target is a directory: '$cleanDirectoryToMonitorForDisplay'"
        $sizeBefore = Get-FormattedDirectorySize -DirectoryPath $directoryToMonitor
        Write-Host "Size of target dir BEFORE deletion: $sizeBefore"
    }

    Write-Host "Attempting to permanently delete '$cleanTargetPathForDisplay'..."
    try {
        Remove-Item -Path $targetPath -Recurse -Force -ErrorAction Stop
        Write-Host "'$cleanTargetPathForDisplay' was successfully permanently deleted."

        if ($isTargetFile) {
            $sizeAfter = Get-FormattedDirectorySize -DirectoryPath $directoryToMonitor
            Write-Host "Size of parent dir AFTER deletion: $sizeAfter"
        } elseif ($isTargetContainer) {
            $sizeAfter = Get-FormattedDirectorySize -DirectoryPath $directoryToMonitor -CallingContext "AfterDeleteTargetWasDirectory"
            Write-Host "Size of target dir AFTER deletion: $sizeAfter"
        }
    }
    catch {
        Write-Error "An error occurred while trying to permanently delete '$cleanTargetPathForDisplay':"
        Write-Error $_.Exception.Message
        if ($directoryToMonitor) {
            $sizeAfter = Get-FormattedDirectorySize -DirectoryPath $directoryToMonitor
            Write-Host "Size of dir AFTER failed deletion attempt: $sizeAfter"
        }
        exit 1
    }
    Write-Host "--- End PowerShell: Permanent Deletion ---`n"
}
elseif ($Mode -eq "Recycle") {
    Write-Host "`n--- PowerShell: Recycle Bin ---"
    Write-Host "Attempting to move '$cleanTargetPathForDisplay' to the Recycle Bin..."
    try {
        Add-Type -AssemblyName Microsoft.VisualBasic -ErrorAction Stop
        [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
            $targetPath, # Use the original provider path for the API call
            [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
            [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin,
            [Microsoft.VisualBasic.FileIO.UICancelOption]::ThrowException
        )
        Write-Host "'$cleanTargetPathForDisplay' was successfully moved to the Recycle Bin."
    }
    catch {
        if ($_.Exception.Source -eq "Microsoft.VisualBasic" -and $_.Exception.InnerException -is [System.OperationCanceledException]) {
             Write-Warning "Operation was potentially cancelled by a system dialog."
        } elseif ($_.FullyQualifiedErrorId -eq "AssemblyLoadError,Add-Type") {
             Write-Error "Failed to load Microsoft.VisualBasic assembly. Ensure .NET Framework is properly installed."
             Write-Error $_.Exception.Message
        }
        else {
            Write-Error "An error occurred while trying to move '$cleanTargetPathForDisplay' to the Recycle Bin:"
            Write-Error $_.Exception.Message
        }
        exit 1
    }
    Write-Host "--- End PowerShell: Recycle Bin ---`n"
}
else {
    Write-Error "Error: Invalid mode specified. Use 'Recycle' or 'Permanent'."
    exit 1
}
# End of script