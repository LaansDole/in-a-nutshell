#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

echo "Installing essential packages"
sudo apt install build-essential -y

# Install curl, wget, git, and zsh
echo "Installing curl, wget, git, and zsh..."
sudo apt install curl wget git zsh python3 python3-pip -y

# Check zsh version
echo "Checking zsh version..."
zsh --version

# Install git-core, curl, and fonts-powerline
echo "Installing git-core, curl, and fonts-powerline..."
sudo apt install git-core curl fonts-powerline -y

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# Install p10k
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo "Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to 'powerlevel10k/powerlevel10k'."
