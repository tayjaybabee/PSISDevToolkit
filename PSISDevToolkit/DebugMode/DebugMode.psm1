# PSISDevToolkit::DebugMode.psm1

function Enable-DebugMode {
    param (
        [Alias('h')]
        [switch]$Help
    )

    # Manually check for --help argument in the invocation line
    $invocation = $PSCmdlet.MyInvocation
    if ($Help -or $invocation.Line -like "*--help*") {
        @"
NAME
    Enable-DebugMode

SYNOPSIS
    Enables the global debug mode.

SYNTAX
    Enable-DebugMode [-Help]

DESCRIPTION
    This function sets the global DebugPreference variable to 'Continue', enabling debug messages.

PARAMETERS
    -Help
        Displays this help message.

EXAMPLES
    PS> Enable-DebugMode
    Enables the global debug mode.

    PS> Enable-DebugMode -Help
    Displays the help message for the Enable-DebugMode function.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    Module: PSISDevToolkit
"@
        return
    }

    Write-Debug "Enabling debug mode."
    $global:DebugPreference = 'Continue'
    Write-Host "Debug mode enabled."
}

function Disable-DebugMode {
    param (
        [Alias('h')]
        [switch]$Help
    )

    # Manually check for --help argument in the invocation line
    $invocation = $PSCmdlet.MyInvocation
    if ($Help -or $invocation.Line -like "*--help*") {
        @"
NAME
    Disable-DebugMode

SYNOPSIS
    Disables the global debug mode.

SYNTAX
    Disable-DebugMode [-Help]

DESCRIPTION
    This function sets the global DebugPreference variable to 'SilentlyContinue', disabling debug messages.

PARAMETERS
    -Help
        Displays this help message.

EXAMPLES
    PS> Disable-DebugMode
    Disables the global debug mode.

    PS> Disable-DebugMode -Help
    Displays the help message for the Disable-DebugMode function.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    Module: PSISDevToolkit
"@
        return
    }

    Write-Debug "Disabling debug mode."
    $global:DebugPreference = 'SilentlyContinue'
    Write-Host "Debug mode disabled."
}

function Get-DebugMode {
    param (
        [Alias('h')]
        [switch]$Help
    )

    # Manually check for --help argument in the invocation line
    $invocation = $PSCmdlet.MyInvocation
    if ($Help -or $invocation.Line -like "*--help*") {
        @"
NAME
    Get-DebugMode

SYNOPSIS
    Displays the current global debug mode status.

SYNTAX
    Get-DebugMode [-Help]

DESCRIPTION
    This function checks the value of the global DebugPreference variable and displays whether debug mode is enabled or disabled.

PARAMETERS
    -Help
        Displays this help message.

EXAMPLES
    PS> Get-DebugMode
    Displays the current global debug mode status.

    PS> Get-DebugMode -Help
    Displays the help message for the Get-DebugMode function.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    Module: PSISDevToolkit
"@
        return
    }

    Write-Debug "Checking debug mode status."
    if ($global:DebugPreference -eq 'Continue') {
        Write-Host "Debug mode is currently enabled."
    } else {
        Write-Host "Debug mode is currently disabled."
    }
}

function Set-DebugMode {
    param (
        [Alias('h')]
        [switch]$Help,
        [Alias('D')]
        [switch]$EnableDebug
    )

    # Manually check for --help argument in the invocation line
    $invocation = $PSCmdlet.MyInvocation
    if ($Help -or $invocation.Line -like "*--help*") {
        @"
NAME
    Set-DebugMode

SYNOPSIS
    Sets the global debug mode based on the specified parameters.

SYNTAX
    Set-DebugMode [-Help] [-EnableDebug]

DESCRIPTION
    This function enables or disables the global debug mode based on the specified parameters.

PARAMETERS
    -Help
        Displays this help message.

    -EnableDebug
        Enables debug messages.

EXAMPLES
    PS> Set-DebugMode -EnableDebug
    Enables debug messages.

    PS> Set-DebugMode
    Disables debug messages.

    PS> Set-DebugMode -Help
    Displays the help message for the Set-DebugMode function.

NOTES
    Author: T. Blackstone
    Company: Inspyre-Softworks
    Module: PSISDevToolkit
"@
        return
    }

    if ($EnableDebug) {
        Write-Debug "Setting debug mode to enabled."
        Enable-DebugMode
    } else {
        Write-Debug "Setting debug mode to disabled."
        Disable-DebugMode
    }
}

# Exporting functions
Export-ModuleMember -Function Enable-DebugMode, Disable-DebugMode, Get-DebugMode
