@{
    ModuleVersion = '1.0.0'
    NestedModules = @(
        '.\DebugMode\DebugMode.psm1',
        '.\IniFile\IniFile.psm1'
    )
    GUID = 'bfcfb705-1b37-4460-8a6a-eacb050fc927'
    Author = 'T. Blackstone'
    CompanyName = 'Inspyre-Softworks'
    PowerShellVersion = '5.1'
    Description = 'A toolkit for Inspyre Softworks developers working in PowerShell, including functions for handling global debug mode.'
    FunctionsToExport = @(
        'Enable-DebugMode',
        'Disable-DebugMode',
        'Get-DebugMode'
    )
}
