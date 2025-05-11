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

# Optional: Reference to the original script for WSL file removal
# alias rm ="./scripts/utils/experimental/wsl-remove.sh Permanent" # Permanent delete a file or folder

# Make sure compinit has been run
autoload -Uz compinit
compinit

# Function to set up completion for ZSH aliases
setup_zsh_alias_completion() {
  for name cmd in ${(kv)aliases}; do
    # extract the "real" command (first word of the alias's right-hand side)
    cmd=${cmd%% *}
    # if zsh knows a _cmd completion function, use it
    if whence -w _${cmd} &>/dev/null; then
      compdef _${cmd} $name
    fi
  done
}

# Function to set up completion for git aliases
setup_git_alias_completion() {
  # Skip if git is not installed or no aliases are defined
  if ! command -v git &> /dev/null || ! git config --get-regexp '^alias\.' &> /dev/null; then
    return
  fi

  # Get all git aliases
  local git_aliases=$(git config --get-regexp '^alias\.' | sed 's/^alias\.//')
  
  # Process each alias
  while read -r line || [[ -n "$line" ]]; do
    # Skip empty lines
    [[ -z "$line" ]] && continue
    
    # Extract alias name and command
    local alias=${line%% *}
    local cmd=${line#* }
    
    # Skip shell commands (those starting with !)
    if [[ "$cmd" == "!"* ]]; then
      continue
    fi
    
    # Set up git completion for this alias
    compdef _git git-$alias
  done <<< "$git_aliases"
}

# Run the completion setup functions
setup_zsh_alias_completion
setup_git_alias_completion