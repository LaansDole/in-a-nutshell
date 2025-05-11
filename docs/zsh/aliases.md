# ZSH Aliases

This page documents the ZSH aliases included in this repository.

## Navigation Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `cd..` | `cd ../` | Go back 1 directory level (for fast typers) |
| `..` | `cd ../` | Go back 1 directory level |
| `...` | `cd ../../` | Go back 2 directory levels |
| `.3` | `cd ../../../` | Go back 3 directory levels |
| `.4` | `cd ../../../../` | Go back 4 directory levels |
| `.5` | `cd ../../../../../` | Go back 5 directory levels |
| `.6` | `cd ../../../../../../` | Go back 6 directory levels |

## Listing Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `ls --color=auto` | List with color |
| `ll` | `ls -l` | Long listing format |
| `la` | `ls -A` | List all except . and .. |
| `lla` | `ls -la` | Long listing of all files |
| `l` | `ls -CF` | List in columns |

## Grep Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `grep` | `grep --color=auto` | Grep with color |
| `fgrep` | `fgrep --color=auto` | Fixed pattern grep with color |
| `egrep` | `egrep --color=auto` | Extended regex grep with color |

## Utility Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `qfind` | `find . -name` | Quickly search for file |
| `help-shell` | Custom awk script | List all shell aliases |
| `help-git` | Custom awk script | List all git aliases |
| `c` | `clear` | Clear screen |
| `reset` | `source ~/.zshrc` | Reload .zshrc |
| `edit` | `vim ~/.zshrc` | Edit .zshrc |
| `seesh` | `cat ~/.zshrc` | View .zshrc |
| `clean-zone` | Custom find script | Clean up Zone.Identifier files |
| `edit-alias` | `vim ~/.zsh-alias.sh` | Edit alias file |

## Optional WSL Aliases

These aliases are commented out by default but can be enabled by removing the comment symbol in your `.zsh-alias.sh` file:

| Alias | Command | Description |
|-------|---------|-------------|
| `rm` | `./scripts/utils/experimental/wsl-remove.sh Permanent` | Delete files/folders permanently in WSL with Windows integration |

To enable safe file deletion with Windows Recycle Bin integration, uncomment the corresponding line in your `.zsh-alias.sh` file:

```bash
# Optional: Reference to the original script for WSL file removal
# alias rm ="./scripts/utils/experimental/wsl-remove.sh Permanent" # Permanent delete a file or folder
```

You can also modify the alias to use the "Recycle" mode instead of "Permanent" to send files to the Windows Recycle Bin instead of deleting them permanently.

For more details about the WSL RemoveItem scripts, see [WSL RemoveItem Scripts](../scripts/utils.md#wsl-removeitem-scripts).
