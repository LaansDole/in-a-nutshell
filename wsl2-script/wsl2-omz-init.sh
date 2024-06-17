#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

echo "Installing essential packages"
sudo apt-get install build-essential -y

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
