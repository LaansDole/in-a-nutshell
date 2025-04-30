# 🌰 Welcome to my `in-a-nutsh` journey 🐚
Since I often reset my WSL2, I need a way to streamline my Linux and MacOS setup.

- System: ***MacOS*** and ***WSL2 Ubuntu***
  
## ♾️ UNIX/Linux and DevOps Project
- [MinIO System Admin](https://github.com/LaansDole/unix-sysadm-minio)
- [CI/CD pipeline for RMIT Store](https://github.com/RMIT-DevOps-Hackathon/COSC2767-RMIT-Store)
- [RMIT ITS Scripts](https://github.com/LaansDole/RMIT-ITS-useful-scripts)

## Pre-requisite

### On MacOS

You must have `Homebrew` installed
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
For best experience, ***[iTerm2](https://iterm2.com/)*** is recommended to install

### On WSL2 or Linux Distros

For best experience, ***[OhMyZsh](./_zsh_/omz-init.sh)*** is recommended to install. 
- Also refer to [zsh ultilities](./_zsh_)

## Getting Started

This repository contains my nerdy customizations:
- For [git aliases](./_git_)
- Zsh Aliases
```bash
# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'

#### Change Directory ####
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

#### Utilities ####
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias help-shell="awk '/^# >>> BEGIN MY ALIASES >>>$/{flag=1}/^#$/{flag=0}flag' ~/.zshrc"          # help-shell: List all aliases in bash
alias help-git="awk '/^### MY GIT ALIASES ###$/{flag=1}/^#$/{flag=0}flag' ~/.gitconfig"    # help-git: List all aliases in git
alias c='clear'                             # c: clear screen

alias reset='source ~/.zshrc'               # reset: reload .zshrc
alias edit='vim ~/.zshrc'                   # edit: modify .zshrc
alias seesh='cat ~/.zshrc'                  # catsh: view .zshrc
alias clean-zone="find . -type f -name '*Zone.Identifier' -exec rm -f {} \;"     # clean up Zone.Identifier files
alias edit-alias='vim ~/.zsh-alias.sh' # Edit alias file

# 1) make sure compinit has been run
autoload -Uz compinit
compinit

# 2) for each alias in $aliases, if there is a completion fn for the real command,
#    bind it to the alias
for name cmd in ${(kv)aliases}; do
  # extract the “real” command (first word of the alias’s right-hand side)
  cmd=${cmd%% *}
  # if zsh knows a _cmd completion function, use it
  if whence -w _${cmd} &>/dev/null; then
    compdef _${cmd} $name
  fi
done
```

## References and Bug Fixes
- See [ZSH README](./_zsh_/README.md) for a clean installation of `node` and `npm` on different OS
<ul>
  <li><a href="https://github.com/romkatv/powerlevel10k#getting-started" target="_blank">Powerlevel10k</a></li>
  <li><a href="http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/" target="_blank">Must Have Git Aliases by @durdn - nicola paolucci</a></li>
  <li><a href="https://github.com/brandwe/Zprofile" target="_blank">.zprofile from @brandwe</a></li>
  <li><a href="https://github.com/koalaman/shellcheck#from-your-terminal" target="_blank">shellcheck</a></li>
  <li><a href="https://dev.to/colinkiama/a-time-saving-git-alias-git-sweep-bhn" target="_blank">A time-saving alias "git sweep"</a></li>
  <li><a href="https://stackoverflow.com/questions/43733089/how-to-configure-a-timeout-for-read-host-in-powershell" target="_blank">Read-HostWithTimeout in PowerShell</a></li>
  <li><a href="https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps" target="_blank">ActiveDirectory Module</a></li>
  <li><a href="https://superuser.com/questions/1780111/cant-update-wsl-to-version-2" target="_blank">Can't update WSL to version 2</a></li>
  <li><a href="https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/" target="_blank">Install OhMyZsh in Ubuntu</a></li>
</ul>
