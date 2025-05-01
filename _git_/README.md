## My Git Alias Setup on macOS (brew)

See [Must Have Git Aliases by @durdn - nicola paolucci](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/) for more information.

If you use git on the command-line, you'll eventually find yourself wanting aliases for your most commonly-used commands.  It's incredibly useful to be able to explore your repos with only a few keystrokes that eventually get hardcoded into muscle memory.

Some people don't add aliases because they don't want to have to adjust to not having them on a remote server.  Personally, I find that having aliases doesn't mean I that forget the underlying commands, and aliases provide such a massive improvement to my workflow that it would be crazy not to have them.

### Getting Started
- To first create your .gitconfig
```
# Configure Git user details
git config --global user.email "<your_email>"
git config --global user.name "<your_name>"
```
- Add the following (remember to replace with your credentials):

[`.gitconfig`](./.gitconfig)
