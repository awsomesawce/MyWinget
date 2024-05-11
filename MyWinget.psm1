function Show-WinGet {

<#
.SYNOPSIS
Show winget packages one after the other
#>
[CmdletBinding()]
param(
[Parameter(Mandatory=$true, ValueFromRemainingArguments=$true, Position=0, ValueFromPipelineByPropertyName)]
[string[]]
$PkgNames,

[Parameter(Mandatory=$false)]
[ValidateNotNullOrEmpty()]
[string]
$OutFile
)
Write-Debug "`$PkgNames: $PkgNames"
Write-Debug "Type: $($PkgNames.GetType())"
if ($OutFile) {
Write-Debug "`$Outfile: $OutFile"
} else {
write-debug "false"
}
}

