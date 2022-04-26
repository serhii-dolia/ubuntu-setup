#!/bin/bash
sudo apt-get -y update && sudo apt-get -y dist-upgrade

### some basic software
sudo apt-get -y install build-essential curl file git vim

### install Vundle - vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### get .vimrc and install plugins
wget -O ~/.vimrc https://raw.githubusercontent.com/serhii-dolia/dotfiles/main/.vimrc
vim +PluginInstall +qall

### move window buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

### install some software
sudo snap install code --classic
sudo snap install emacs --classic
sudo snap install keepassxc
sudo apt-get install tilix

### get emacs dotfile
wget -O ~/.emacs https://raw.githubusercontent.com/serhii-dolia/dotfiles/main/.emacs
### install vscode extensions

code --install-extension vscode-icons-team.vscode-icons;
code --install-extension dbaeumer.vscode-eslint;
code --install-extension eamodio.gitlens;
code --install-extension esbenp.prettier-vscode;
code --install-extension alefragnani.project-manager;

### install Jetbrains Mono fonttype
mkdir ~/.local/share/fonts
mkdir temp-font && cd temp-font
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
unzip JetBrainsMono-2.242.zip -d ~/.local/share/fonts
cd ../ && pwd &&  rm -r temp-font

### install nvm
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh" | bash;
source ~/.nvm/nvm.sh
nvm install 18
nvm install 16

### set zsh as default and install oh-my-zsh
sudo apt -y install zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### use nvm in .zsh
echo "export NVM_DIR=\"\$HOME/.nvm\"" >> ~/.zshrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"  # This loads nvm" >> ~/.zshrc
echo "[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"  # This loads nvm bash_completion" >> ~/.zshrc

### remove energy-safe mode for wifi
sudo sed -i 's/3/2/' '/etc/NetworkManager/conf.d/default-wifi-powersave-on.conf'
sudo systemctl restart NetworkManager.service

