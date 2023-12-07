# Welcome to my `in-a-nutsh` journey on MacOS and WSL Linux distros
## Getting Started
- This repository contains my learning journey for Shell Scripting and other nerdy customizations. 
- Disclaimer: It is a bit tricky to setup my configuration on UNIX/Linux, I would suggest to follow the guide and only copy my aliases
## Pre-requisites
- `.zshrc` file and `shellcheck-stable` directory must be in the same directory [Optional]
- You must allow `shellcheck-stable` to be run on MacOS, otherwise the system will prevent you from running it [Optional]
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

## References and Bug Fixes
<ul>
  <li><a href="https://github.com/romkatv/powerlevel10k#getting-started" target="_blank">Powerlevel10k</a></li>
  <li><a href="http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/" target="_blank">Must Have Git Aliases by @durdn - nicola paolucci</a></li>
  <li><a href="https://github.com/brandwe/Zprofile" target="_blank">.zprofile from @brandwe</a></li>
  <li><a href="https://github.com/koalaman/shellcheck#from-your-terminal" target="_blank">shellcheck</a></li>
  <li><a href="https://dev.to/colinkiama/a-time-saving-git-alias-git-sweep-bhn" target="_blank">A time-saving alias "git sweep"</a></li>
  <li><a href="https://stackoverflow.com/questions/43733089/how-to-configure-a-timeout-for-read-host-in-powershell" target="_blank">Read-HostWithTimeout in PowerShell</a></li>
  <li><a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps" target="_blank">ActiveDirectory Module</a></li>
  <li><a href="https://superuser.com/questions/1780111/cant-update-wsl-to-version-2" target="_blank">Install WSL2</a></li>
  <li><a href="https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/" target="_blank">Install OhMyZsh in Ubuntu</a></li>
</ul>
  
## UNIX/Linux Project
- [MinIO System Admin](https://github.com/LaansDole/unix-sysadm-minio)
