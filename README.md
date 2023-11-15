# Welcome to my in a nutsh journey on MacOS
## Getting Started
- This repository contains my learning journey for Shell Scripting and other nerdy customizations. 
- Disclaimer: It is a bit tricky to setup my configuration on UNIX/Linux, I would suggest to follow the guide and only copy my aliases
## Pre-requisites
- `.zshrc` file and `shellcheck-stable` directory must be in the same directory
- You must allow `shellcheck-stable` to be run on MacOS, otherwise the system will prevent you from running it
- For macOS, you must have `Homebrew` installed
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- (optional) `shellcheck-stable` directory is installed, if not, see the References below 

## Usage
- For best experience, ***[iTerm2](https://iterm2.com/)*** is recommended to install
- Regarding first time setup, remember to `source ./.zshrc` to save your changes. 
- [OPTIONAL] If your default shell is bash, do:
```bash
cd ~
echo "exec zsh" >> .bashsrc
```

## References
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k#getting-started)
- [.zprofile from @brandwe](https://github.com/brandwe/Zprofile)
- [Must Have Git Aliases by @durdn - nicola paolucci](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/)
- [shellcheck](https://github.com/koalaman/shellcheck#from-your-terminal)
- [A time-saving alias "git sweep"](https://dev.to/colinkiama/a-time-saving-git-alias-git-sweep-bhn)
- [Read-HostWithTimeout in PowerShell](https://stackoverflow.com/questions/43733089/how-to-configure-a-timeout-for-read-host-in-powershell)
- [ActiveDirectory Module](https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps)
- [Install WSL2](https://superuser.com/questions/1780111/cant-update-wsl-to-version-2)
  
## UNIX/Linux Project
[MinIO System Admin](https://github.com/LaansDole/unix-sysadm-minio)
