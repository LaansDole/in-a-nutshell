#!/bin/bash

# Clone powerlevel10k theme into oh-my-zsh's custom themes directory
echo "Cloning powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change the ZSH_THEME in .zshrc file
echo "Changing ZSH_THEME in .zshrc file..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
else
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
fi

# Inform the user to manually source .zshrc
echo "Please run 'source ~/.zshrc' to apply the changes."
