
<#
.SYNOPSIS
A simple version of show winget
#>

[CmdletBinding()]
Param(
    [Parameter(ValueFromRemainingArguments)]
    [string[]]
    $PkgNames
)

if ($PkgNames.Count -lt 1) {
    Write-Debug "Why are there no arguments?"
    Write-Debug "Add an argument stupid!"
}
elseif ($PkgNames.Count -gt 1) {
    Write-Debug "Here we go!"
    Write-Verbose "`$PkgNames is $PkgNames"
    foreach ($i in $PkgNames) {
        winget show $i
    }
}
else {
    Write-Host "Not sure why tyhis would be printed..."
}
return 0

