# IniFile.psm1

# Import the DebugMode module
Import-Module "$PSScriptRoot\..\DebugMode\DebugMode.psm1"

function Read-IniFile {
    param (
        [string]$Path,
        [Alias('h')]
        [switch]$Help,
        [Alias('D')]
        [switch]$Debug
    )

    if ($Debug) {
        Enable-DebugMode
    }

    if ($Help) {
        @"
NAME
    Read-IniFile

SYNOPSIS
    Reads an INI file and returns its content as a hashtable.

SYNTAX
    Read-IniFile -Path <string> [-Help] [-Debug]

DESCRIPTION
    This function reads an INI file from the specified path and converts its sections and key-value pairs into a hashtable.

PARAMETERS
    -Path <string>
        The path to the INI file.

    -Help
        Displays this help message.

    -Debug
        Enables debug logging.

EXAMPLES
    PS> Read-IniFile -Path 'C:\path\to\config.ini'
    Reads the INI file located at 'C:\path\to\config.ini' and returns its content as a hashtable.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    This function is part of the PSISDevToolkit module.
"@
        return
    }

    Write-Debug "Reading INI file from path: $Path"
    $ini = @{}
    $section = ""

    foreach ($line in Get-Content $Path) {
        $line = $line.Trim()
        Write-Debug "Processing line: $line"

        if ($line -match "^\[(.+)\]$") {
            $section = $matches[1]
            Write-Debug "New section: $section"

            if (-not $ini.ContainsKey($section)) {
                $ini[$section] = @{}
            }
        } elseif ($line -match "^(.+?)\s*=\s*(.+)$") {
            $key = $matches[1].Trim()
            $value = $matches[2].Trim()
            Write-Debug "Key: $key, Value: $value"
            $ini[$section][$key] = $value
        }
    }

    return $ini
}

function Write-IniFile {
    param (
        [string]$Path,
        [hashtable]$Data,
        [Alias('h')]
        [switch]$Help,
        [Alias('D')]
        [switch]$Debug
    )

    if ($Debug) {
        Enable-DebugMode
    }

    if ($Help) {
        @"
NAME
    Write-IniFile

SYNOPSIS
    Writes a hashtable's content to an INI file.

SYNTAX
    Write-IniFile -Path <string> -Data <hashtable> [-Help] [-Debug]

DESCRIPTION
    This function writes the content of a hashtable to an INI file at the specified path.

PARAMETERS
    -Path <string>
        The path to the INI file.

    -Data <hashtable>
        The hashtable containing the INI file data.

    -Help
        Displays this help message.

    -Debug
        Enables debug logging.

EXAMPLES
    PS> \$config = Read-IniFile -Path 'C:\path\to\config.ini'
    PS> \$config['SectionName']['SettingName'] = 'NewValue'
    PS> Write-IniFile -Path 'C:\path\to\config.ini' -Data \$config
    Modifies the setting 'SettingName' in 'SectionName' to 'NewValue' and writes it back to the INI file.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    This function is part of the PSISDevToolkit module.
"@
        return
    }

    Write-Debug "Writing INI file to path: $Path"
    $content = @()

    foreach ($section in $Data.Keys) {
        Write-Debug "Processing section: $section"
        $content += "[$section]"
        foreach ($key in $Data[$section].Keys) {
            $value = $Data[$section][$key]
            Write-Debug "Key: $key, Value: $value"
            $content += "$key=$value"
        }
        $content += ""
    }

    $content | Set-Content -Path $Path
}

# Exporting functions
Export-ModuleMember -Function Read-IniFile, Write-IniFile