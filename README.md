# MyWinget

## What is it

`winget` convenience functions

## Why

I got tired of writing the foreach function to show multiple package infos on the command
line, so I wrote this module.

## Functions

### `Show-Winget`

<!-- This was yanked from the actual help comment on the function. -->
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

### Show-WingetSimple

A simple implementation of `Show-Winget` for demonstration purposes.

