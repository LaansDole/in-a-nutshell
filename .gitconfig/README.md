## My Git Alias Setup on macOS (brew)

See [Must Have Git Aliases by @durdn - nicola paolucci](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/) for more.

If you use git on the command-line, you'll eventually find yourself wanting aliases for your most commonly-used commands.  It's incredibly useful to be able to explore your repos with only a few keystrokes that eventually get hardcoded into muscle memory.

Some people don't add aliases because they don't want to have to adjust to not having them on a remote server.  Personally, I find that having aliases doesn't mean I that forget the underlying commands, and aliases provide such a massive improvement to my workflow that it would be crazy not to have them.

### Prerequisite

- `brew` and `git` Installation
- `sudo apt-get install git bash-completion` (Unix/Linux) or `brew install git bash-completion` (macOS) Installation
- Knows how to insert and exit `vim` (You can google it)

### Getting Started
- To find your `.bash_profile`, on terminal, run:
```bash
find ~ -name .bash_profile
```
- It is usually in your `$HOME` directory, if it does not exist, do:
```bash
cd $HOME
touch .bash_profile
```
- Then edit the file:
```bash
vim .bash_profile
```
If you add the following code to your `.bash_profile`, it will automatically create completion-aware `g<alias>` bash aliases for each of your git aliases.

```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_get_config_variables "alias"`; do
    alias g$al="git $al"
    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done
```

## My custom aliases

I can always use `git la` whenever I need to see my aliases again.

`vim .gitconfig`

Global git configuration file:

```gitconfig
[user]
	name = <your_name>
	email = <your_email>
[core]
	autocrlf = input
	excludesfile = /Users/np/.gitignore_global
    	pager=less -x4

# include sendemail config {{{
[include]
    path = ~/.git-sendemail
# }}}
# color {{{
[color]
    branch = auto
    diff = auto
    status = auto

[color "branch"]
    current = red reverse
    local = blue
    remote = green

[color "diff"]
    meta = yellow
    frag = magenta
    old = red bold
    new = green
    plain = white

[color "status"]
    added = yellow
    changed = green
    untracked = cyan

# }}}

# push/pull/diff/options {{{
[push]
    default = current
[pull]
    default = current
[diff]
    mnemonicprefix = true
[branch]
    autosetuprebase = always
[apply]
    whitespace = nowarn

#}}}

# alias {{{
[alias]
# basic {{{
    st = status -s
    cl = clone
    ci = commit
    co = checkout
    br = branch
    sw = switch
    swb = checkout -
    r = reset
    	# }}}
# commit {{{
    ada = add .
    ca = commit --amend
    amend = commit --amend
    caa = commit -a --amend -C HEAD
    puf = push --force-with-lease
	# }}}
# diff {{{
    d = diff --word-diff
    dc = diff --cached
    # diff last commit
    dlc = diff --cached HEAD^
    # diff status: A git diff, but with only the filenames (which reminds me of git status)
    diffst = diff --name-only
    	# }}}
# reset commands {{{
    r1 = reset HEAD^
    r2 = reset HEAD^^
    rh = reset --hard
    rh1 = reset HEAD^ --hard
    rh2 = reset HEAD^^ --hard
    	# }}}
# various useful {{{
    # list remotes
    rem= "!git config -l | grep remote.*url | tail -n +2"
    # list all aliases
    la = "!git config -l | grep alias | cut -c 7-"
    # worktree list
    wl = worktree list
    # history: This is pretty much the only way I look at my log. 
    # Aside from providing one-line logs, it also shows the branching in/out
    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    # branch delete here: Deletes all local branches that have already been merged to the branch that you're currently on
    brdhere = !sh -c \"git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d\"

# }}}

[rerere]
  enabled = false
[rebase]
  autosquash = true
[filter "lfs"]
	clean = git-lfs clean %f
	smudge = git-lfs smudge %f
	required = true
```

To see your changes:
`cat .gitconfig`
