#!/usr/bin/env -S pwsh -noprofile



function Show-WinGet {

    <#
.SYNOPSIS
Show winget packages one after the other
.DESCRIPTION
This function is an upgrade of the simple one I use on the commandline.
It uses `ValueFromRemainingArguments` because I don't like to separate args with commas.
.PARAMETER PkgNames
Array of strings of names of packages to look up on winget
.PARAMETER OutFile
File to output information to.
.PARAMETER PassThru
Whether or not to display items on commandline when paired with $OutFile
.FUNCTIONALITY
convenience
.EXAMPLE
Show-Winget -OutFile pkginfo.txt Microsoft.Powershell KDE.Kate

Prints package info to pkginfo.txt
.NOTES
I will include a simple version in this module for demonstration purposes.

TODO: Add more functionality
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true, Position = 0, ValueFromPipelineByPropertyName)]
        [string[]]
        $PkgNames,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]
        $OutFile,

        [Parameter()]
        [switch]
        $PassThru
    )
    Write-Debug "`$PkgNames: $PkgNames"
    Write-Debug "Type: $($PkgNames.GetType())"
    if ($OutFile) {
        if (Test-Path $OutFile) {
            # ! File must not exist
            Write-Error "File already exists at $OutFile"
            throw "ERROR: File exists"
        }
        Write-Debug "Writing to `$outfile $outfile"
        
        foreach ($item in $PkgNames) {
            if ($PassThru) {
                Write-Verbose "Looking up $item"
                winget show $item | Tee-Object -FilePath $OutFile -Append -Encoding utf8
            } else {
                winget show $item | out-file -FilePath $OutFile -Encoding utf8 -Append -NoClobber
            }
        }
    }
    else {
        write-debug "no outfile"
        
        $PkgNames | ForEach-Object {
            Write-Verbose "Looking up $_"
            winget show $_
        }
        Write-Verbose "Done"
    }
}

function Show-WingetSimple {
    <#.SYNOPSIS
    Simple implementation of this function.
    #>
    foreach ($i in $args) {winget show $i}
}



Export-ModuleMember -Function @('Show-Winget', 'Show-WingetSimple')
