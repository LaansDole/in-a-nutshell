# Utility Scripts

This section covers utility scripts included in this repository.

## fzadd.sh

The `fzadd.sh` script provides a fuzzy finder interface for Git staging operations.

[View Script Source](https://github.com/LaansDole/in-a-nutshell/blob/main/scripts/utils/fzadd.sh)

### Usage

```bash
./scripts/utils/fzadd.sh
```

### Features

- Interactive selection of files to stage using fuzzy finder (fzf)
- Fallback to manual selection if fzf is not available
- Preview of diffs for each file
- Multi-select functionality

### Options

- `-h` or `--help`: Show the help message

## WSL RemoveItem Scripts

The RemoveItem scripts provide WSL users with the ability to delete files and folders with Windows Recycle Bin integration.

### Overview

When working in WSL, native Linux `rm` commands permanently delete files without sending them to the Recycle Bin. These scripts bridge that gap by allowing you to safely delete files from WSL with the option to:

1. Send to the Windows Recycle Bin (recoverable)
2. Delete permanently (with size reporting)

### Components

- **wsl-RemoveItem.sh** - Bash wrapper script that runs from WSL
- **Smart-RemoveItem.ps1** - PowerShell script that performs the actual operations in Windows

[View WSL Script Source](https://github.com/LaansDole/in-a-nutshell/blob/main/scripts/utils/experimental/wsl-RemoveItem.sh)

[View PowerShell Script Source](https://github.com/LaansDole/in-a-nutshell/blob/main/scripts/utils/experimental/Smart-RemoveItem.ps1)

### Requirements

- Windows Subsystem for Linux (WSL) installed
- PowerShell access from WSL

### Setup

1. Place the PowerShell script in your Windows home directory:
   ```
   C:\Users\<your-username>\Smart-RemoveItem.ps1
   ```

2. Edit the `wsl-RemoveItem.sh` script to update the path to your PowerShell script:
   ```bash
   local win_script_path="C:\\Users\\<your-username>\\Smart-RemoveItem.ps1"
   ```

3. Make the shell script executable:
   ```bash
   chmod +x scripts/utils/experimental/wsl-RemoveItem.sh
   ```

### Usage

```bash
./scripts/utils/experimental/wsl-RemoveItem.sh <Recycle|Permanent> <path_to_wsl_file_or_folder>
```

#### Examples

Send a file to the Recycle Bin:
```bash
./wsl-RemoveItem.sh Recycle ~/documents/old-file.txt
```

Permanently delete a directory:
```bash
./wsl-RemoveItem.sh Permanent ~/temp/unwanted-folder
```

### Features

- Safely delete files and directories from WSL
- Option to send to Recycle Bin or delete permanently
- Reports directory size before and after deletion (for permanent mode)
- Proper error handling and status reporting
- Preserves Windows path translation for cross-platform compatibility
