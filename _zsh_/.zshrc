# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##################
### MY ALIASES ###
##################

alias l="ls -al"
alias lp="ls -p"
alias h=history
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

#### Change Directory ####
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias finder='open -a Finder ./'            # finder:       Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#### Utilities ####
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias help-shell="awk '/^### MY ALIASES ###$/{flag=1}/^#$/{flag=0}flag' ~/.zshrc"    	   # help-shell: List all aliases in bash
alias help-git="awk '/^### MY GIT ALIASES ###$/{flag=1}/^#$/{flag=0}flag' ~/.gitconfig"    # help-git: List all aliases in git 
alias reset='source ~/.zshrc'		    # reset: reset .zshrc
alias vimsh='vim ~/.zshrc'		    # vimsh: modify .zshrc		
alias seesh='cat ~/.zshrc'		    # seesh: see .zshrc

########################
### FUNCTION ALIASES ###
########################

cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'

#### Change name of a file ####
change_name() {
	if [ -e "$1" ]
	then
		rsync -r "$1" "$2"
		rm -r "$1"
	else
		echo "$1 file or directory does not exist"
	fi
}

#### Find a directory ####
find_dir() {
	echo -e "Finding the directory..."
	path=$(sudo find / -type d -name "$1" 2>/dev/null | head -n 1)
	if [[ -n $path ]];
	then
		cd "$HOME" || exit
		cd "$path" || exit
		echo "List all contents from $path: "
		output=$(ls "$path")
		if [ -z "$output" ];
		then
			echo -e "Directory is empty!"
		else
			ls -la "$path"
		fi		
	else
		echo "Directory does not exist. Do you want to make this?(Y/N) "
		read -r yes
		if [ "$yes" == 'Y' ]
		then
			echo "Making directory $1"
			mkdir -p "$1"
		else
			echo "Exit"
		fi
	fi
}

#### Move a file to directory ####
move_file() {
	if [ -e "$1" ]
	then
		if [ -d "$2" ]
		then	
			filename=$(basename "$1")
			mv "$1" "$2/$filename"
			echo "$1 moved to /$2"
		else
			echo "$1 file or $2 directory does not exist at $(pwd)"	
		fi
	else
		echo "$1 file or $2 directory does not exist at $(pwd)"
	fi
}

#### WTF is this ####
wtf() {
	set -euo pipefail

	args="$@"
	query=$(printf %s "$args" | jq -sRr @uri)
	url="https://explainshell.com/explain?cmd=$query"

	if command -v xdg-open &> /dev/null
	then
	    xdg-open "$url"
	fi
}

#### Shellcheck ####
shellcheck() {
	for file in "$@"; do
	    echo -e " \n-----------Checking $file-----------\n "
	    output=$(~/shellcheck-stable/shellcheck "$file")

	    if [ -z "$output" ]; then
	        echo -e "ShellCheck found no issues in $file.\n"
	    else
	        echo -e "ShellCheck output for $file: $output\n"
	    fi
	done
}

trash () { command mv "$@" ~/.Trash ; }     	   # trash:        Moves a file to the MacOS trash
quicklook () { qlmanage -p "$*" >& /dev/null; }    # quicklook:           Opens any file in MacOS Quicklook Preview

#### Help me ####
helpme() {
  while true; do
    
    echo "What do you need help with?"
    echo "1. shell"
    echo "2. git"
    echo "3. change_name"
    echo "4. find_dir"
    echo "5. move_file"
    echo "6. wtf"
    echo "7. shellcheck"

    echo -e "\nEnter your choice: "
    read choice

    case $choice in
        1)
            help-shell
	    break
            ;;
        2)
            help-git
	    break
            ;;
        3)
            echo ">>> change_name <old_name> <new_name>: Changes the name of a file or directory from <old_name> to <new_name>."
            break
	    ;;
        4)
            echo ">>> find_dir <dir_name>: Finds a directory with the name <dir_name>. If it doesn't exist, it asks if you want to create it."
            break
	    ;;
        5)
            echo ">>> move_file <file_path> <dir_path>: Moves a file from <file_path> to directory at <dir_path>."
            break
	    ;;
        6)
            echo ">>> wtf <command>: Opens a web page explaining the given command."
            break
	    ;;
        7)
            echo ">>> shellcheck <file1> <file2> ...: Checks shell scripts for common errors and potential issues."
            break
	    ;;
        *)
            echo -e ">>> Invalid choice.\n"
            ;;
    esac
  done
}


######################
### SYSTEM ALIASES ###
######################

alias memHogsTop='top -l 1 -o rsize | head -20'                          # memHogsTop, memHogsPs: Find memory hogs
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'       # cpu_hogs: Find CPU hogs
alias topForever='top -l 9999999 -s 10 -o cpu'                           # topForever: Continual 'top' listing (every 10 seconds)
alias ttop="top -R -F -s 10 -o rsize"					 # ttop:  Recommended 'top' invocation to minimize resources
alias mountReadWrite='/sbin/mount -uw /'    				 # mountReadWrite:   For use when booted into single-user
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"		 # cleanupDS: Recursively delete .DS_Store file
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'		# finderShowHidden: Show hidden files in Finder
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'		# finderHideHidden: Hide hidden files in Finder
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

###################
### END ALIASES ###
###################