## My Git Alias Setup on macOS (brew)

See [Must Have Git Aliases by @durdn - nicola paolucci](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/) for more information.

If you use git on the command-line, you'll eventually find yourself wanting aliases for your most commonly-used commands.  It's incredibly useful to be able to explore your repos with only a few keystrokes that eventually get hardcoded into muscle memory.

Some people don't add aliases because they don't want to have to adjust to not having them on a remote server.  Personally, I find that having aliases doesn't mean I that forget the underlying commands, and aliases provide such a massive improvement to my workflow that it would be crazy not to have them.

### Prerequisite

- `brew` (on MacOS) and `git` Installation
- `sudo apt-get install git bash-completion` (Unix/Linux) or `brew install git bash-completion` (macOS) Installation
- Knows how to insert and exit `vim` (You can google it)

### Getting Started
- To first create your .gitconfig
```
# Configure Git user details
git config --global user.email "dolelongan@gmail.com"
git config --global user.name "dolelongan"
```
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

I can always use `help-git` whenever I need to see my aliases again.

[`vim .gitconfig`](./.gitconfig)

To see your changes:
`cat .gitconfig`
