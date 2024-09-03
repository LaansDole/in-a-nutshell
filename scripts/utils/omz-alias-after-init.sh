#!/bin/bash

# Clone zsh-autosuggestions and zsh-syntax-highlighting into oh-my-zsh's custom plugins directory
echo "Cloning zsh-autosuggestions and zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change the plugins in .zshrc file
echo "Changing plugins in .zshrc file..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
else
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
fi

# Instruct the user to manually source .zshrc
echo "Please run 'source ~/.zshrc' to apply the changes."

# Unset ZSH_AUTOSUGGEST_USE_ASYNC in .zshrc
echo "Unsetting ZSH_AUTOSUGGEST_USE_ASYNC..."
echo "unset ZSH_AUTOSUGGEST_USE_ASYNC" >> ~/.zshrc

# Append aliases to .zshrc file
echo "Appending aliases to .zshrc file..."
cat <<EOT >> ~/.zshrc

##################
### MY ALIASES ###
##################

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "\$(dircolors -b ~/.dircolors)" || eval "\$(dircolors -b)"
    export LS_COLORS="\$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=\$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=\$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=\$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=\$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=\$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=\$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=\$'\E[0m'        # reset underline

    # Take advantage of \$LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "\${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
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
alias help-shell="awk '/^### MY ALIASES ###\$/{flag=1}/^#$/{flag=0}flag' ~/.zshrc"          # help-shell: List all aliases in bash
alias help-git="awk '/^### MY GIT ALIASES ###\$/{flag=1}/^#$/{flag=0}flag' ~/.gitconfig"    # help-git: List all aliases in git
alias c='clear'                             # c: clear screen

alias reset='source ~/.zshrc'               # reset: reset .zshrc
alias vimsh='vim ~/.zshrc'                  # vimsh: modify .zshrc
alias seesh='cat ~/.zshrc'                  # seesh: see .zshrc

EOT

# Source .zshrc to apply changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc

