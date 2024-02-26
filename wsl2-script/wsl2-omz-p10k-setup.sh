# Clone powerlevel10k theme into oh-my-zsh's custom themes directory
echo "Cloning powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change the ZSH_THEME in .zshrc file
echo "Changing ZSH_THEME in .zshrc file..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Source .zshrc to apply changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc
