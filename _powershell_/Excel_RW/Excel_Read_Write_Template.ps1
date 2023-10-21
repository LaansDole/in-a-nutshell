#===========================================================================
#region Run script as elevated admin and unrestricted executionpolicy
#===========================================================================

# Check if running as an administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Not running as an administrator, so relaunch as administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}
Write-Host "Running with elevated privileges."
# We are running as an administrator, so change the title and background colour to indicate this
$Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)";
$Host.UI.RawUI.BackgroundColor = "DarkBlue";
Clear-Host;

#endregion

$ExcelObj = New-Object -comobject Excel.Application
# Replace with the name of the Excel File you want
$ExcelWorkBook = $ExcelObj.Workbooks.Open("C:\Users\v122983\Documents\PDQ Cleanup Status Report.xlsx")
# $ExcelWorkBook.Sheets| fl Name, Index

<#
foreach ($sheet in $ExcelWorkBook.Sheets) {
    $sheet.Name
}
#>

# Get the number of worksheets
$sheetCount = $ExcelWorkBook.Sheets.Count

# Print the number of worksheets
Write-Host "The workbook contains $sheetCount worksheets." -ForegroundColor Yellow -BackgroundColor DarkGreen

# Replace with the name of the worksheet
$ExcelWorkSheet = $ExcelWorkBook.Sheets.Item("VNM|EXP|GMKT, Digital & Recruit")
# OR
# $ExcelWorkSheet = $ExcelWorkBook.Sheets.Item(1)

<#
foreach ($sheet in $ExcelWorkBook.Sheets) {
        
	$ExcelWorkSheet = $ExcelWorkBook.Sheets.Item($sheet.Name)
        $currentsheet = $ExcelWorkSheet.Name
        Write-Host "Current Worksheet: $currentsheet" -ForegroundColor Yellow -BackgroundColor DarkGreen  
}
#>

$currentsheet = $ExcelWorkSheet.Name
Write-Host "Worksheet: $currentsheet" -ForegroundColor Yellow -BackgroundColor DarkGreen

# Get the used range of the worksheet
$usedRange = $ExcelWorkSheet.UsedRange

# Iterate over each row in the used range
for ($row = 2; $row -le $usedRange.Rows.Count; $row++) {
    # Get the value of column A and column B in the current row
    $hostname = $usedRange.Cells.Item($row, 1).Value2

    if ($hostname -eq $null) { break; }

    $sn = $usedRange.Cells.Item($row, 2).Value2
    $tagcode = $usedRange.Cells.Item($row, 3).Value2

    # Print the values
    Write-Output "Row ${row}: Host name = ${hostname}, S/N = ${sn}, Tag Code = ${tagcode}"
}
pause