function Show-WinGet {

    <#
.SYNOPSIS
Show winget packages one after the other
.DESCRIPTION
This function is an upgrade of the simple one I use on the commandline.
It uses `ValueFromRemainingArguments` because I don't like to separate args with commas.
.NOTES
I will include a simple version in this module for demonstration purposes.
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true, Position = 0, ValueFromPipelineByPropertyName)]
        [string[]]
        $PkgNames,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]
        $OutFile
    )
    Write-Debug "`$PkgNames: $PkgNames"
    Write-Debug "Type: $($PkgNames.GetType())"
    if ($OutFile) {
        Write-Debug "`$Outfile: $OutFile"
    }
    else {
        write-debug "false"
    }
}

Export-ModuleMember -Function 'Show-Winget'