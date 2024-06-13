# PSISDevToolkit

## Overview

The `PSISDevToolkit` is a PowerShell toolkit for Inspyre Softworks developers. It includes functions for handling global debug mode and managing ini files. The toolkit is structured into several modules, each serving a specific purpose.

## Project Structure

```
PSISDevToolkit
│   example_config.ini
│   PSISDevToolkit.psd1
│   PSISDevToolkit.psm1
│
├───DebugMode
│       DebugMode.psd1
│       DebugMode.psm1
│
└───IniFile
        IniFile.psd1
        IniFile.psm1
```

### Main Module

- **PSISDevToolkit.psd1**: Module manifest for the PSISDevToolkit.
- **PSISDevToolkit.psm1**: Main module file that imports sub-modules and exports functions.

### DebugMode Module

The DebugMode module includes functions for handling global debug mode settings in PowerShell.

- **DebugMode.psd1**: Module manifest for DebugMode.
- **DebugMode.psm1**: Contains functions to enable, disable, and get the status of debug mode.

### IniFile Module

The IniFile module includes functions for managing ini files.

- **IniFile.psd1**: Module manifest for IniFile.
- **IniFile.psm1**: Contains functions to read, write, and manipulate ini files.

## Installation

### From PSGallery

1. Ensure you have the latest version of PowerShellGet:
    ```powershell
    Install-Module -Name PowerShellGet -Force -Scope CurrentUser
    ```

2. Set up PowerShell to install from repositories and trust PSGallery:
    ```powershell
    Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
    ```

3. Install the PSISDevToolkit module:
    ```powershell
    Install-Module -Name PSISDevToolkit -Scope CurrentUser
    ```

### From Source

1. Clone the repository to your local machine:
    ```sh
    git clone https://github.com/tayjaybabee/PSISDevToolkit.git
    ```

2. Import the module in your PowerShell profile:
    ```powershell
    Import-Module -Name "path\to\PSISDevToolkit\PSISDevToolkit.psm1"
    ```

3. Optionally, you can run the `Install-PSISDevToolkit` function to automatically add the necessary imports and aliases to your PowerShell profile:
    ```powershell
    Install-PSISDevToolkit
    ```


### Manual Installation

1. Clone the repository to your local machine.
2. Place the `PSISDevToolkit` folder in one of the PowerShell module paths (e.g., `C:\Users\YourUser\Documents\WindowsPowerShell\Modules\`).

## Usage

### Importing the Module

```powershell
Import-Module PSISDevToolkit
```

### Enabling Debug Mode

```powershell
Enable-DebugMode
```

### Disabling Debug Mode

```powershell
Disable-DebugMode
```

### Checking Debug Mode Status

```powershell
Get-DebugMode
```

### Setting Debug Mode

```powershell
Set-DebugMode -EnableDebug
Set-DebugMode
```

### Reading an INI File

```powershell
$config = Read-IniFile -Path 'C:\path	o\config.ini'
```

### Writing to an INI File

```powershell
Write-IniFile -Path 'C:\path	o\config.ini' -Data $config
```

## Configuration

The module includes an example configuration file `example_config.ini`. Customize this file as needed and place it in the appropriate directory for your project.

## Contributions

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License.
