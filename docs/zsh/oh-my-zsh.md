# Oh My Zsh Setup

This page covers the setup and configuration of Oh My Zsh included in this repository.

## Installation

You can install Oh My Zsh using the provided script:

```bash
./_zsh_/omz-init.sh
```

This script will:

1. Update package lists
2. Install essential packages
3. Install curl, wget, git, and zsh
4. Install git-core, curl, and fonts-powerline
5. Install Oh My Zsh
6. Install Powerlevel10k theme

## Powerlevel10k Theme

The script sets up the Powerlevel10k theme, which provides a highly customizable prompt with many features.

After installation, you need to:

1. Open your `~/.zshrc` file
2. Find the line that sets `ZSH_THEME`
3. Change its value to `powerlevel10k/powerlevel10k`

The first time you open a new terminal after this change, the Powerlevel10k configuration wizard will run automatically.

## Customization

For further customization of your Oh My Zsh setup, you can:

1. Install additional plugins by adding them to the `plugins=()` array in your `~/.zshrc`
2. Add custom aliases to your `~/.zsh-alias.sh` file
3. Sync your aliases using the `sync-zsh-alias.sh` script

## References

For more information, see the official documentation:

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
