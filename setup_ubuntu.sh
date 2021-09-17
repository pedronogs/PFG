# Install ZSH shell
sudo apt install zsh
chsh -s $(which zsh)

# Install OH MY ZSH and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf$ ~/.fzf/install
cp .zshrc ~/.zshrc
