#!/bin/bash

cd
sudo apt update && sudo apt upgrade -y

# ncurses
sudo apt install libncurses-dev -y

# clipboard
sudo apt install xclip -y
# eza 
sudo apt install eza -y

# numlock
sudo apt install numlockx -y

# Neovim build requirements 
sudo apt-get install ninja-build gettext cmake unzip curl build-essential -y

# Python
sudo apt install python3 python-is-python3 python3-venv -y

# Node + npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 25

# Neovim
TMP=$(mktemp -d)
cd $TMP

git clone https://github.com/neovim/neovim --depth 1 --branch stable
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

rm -rf $TMP

# NvChad dependency
sudo apt install ripgrep -y

# NvChad
cd
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/aCertainProgrammer/nvim_config.git ~/.config/nvim

# Go
if [ -d /usr/local/go ]; then
    echo "Found an old go installation, removing..."
    sudo rm -rf /usr/local/go
    echo "Old installation successfully removed!"
fi

TMP=$(mktemp -d)
cd $TMP

gozip=go1.25.3.linux-amd64.tar.gz
curl -LO https://go.dev/dl/$gozip
sudo tar -C /usr/local -xzf $gozip

rm -rf $TMP
cd

# Tmux
sudo apt install tmux -y
mkdir ~/.config/tmux/
git clone https://github.com/aCertainProgrammer/tmux_config.git ~/.config/tmux/ 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Jetbrains font
TMP=$(mktemp -d)
cd $TMP

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir fonts
unzip JetBrainsMono.zip -d fonts
cd fonts
sudo mkdir /usr/share/fonts/truetype/JetBrainsMono/
sudo cp * /usr/share/fonts/truetype/JetBrainsMono/
sudo fc-cache -f -v

rm -rf $TMP

# Bashrc
cd ~/dev/universal_setup/
cat bashrc >> ~/.bashrc

# Terminal
cd 
UUID=$(gsettings get org.gnome.Terminal.ProfilesList list | cut -d "'" -f 2)
gsettings set \
    "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/" \
    "font" \
    "JetBrainsMono Nerd Font 18" 

gsettings set \
    "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/" \
    "use-theme-colors" \
    false 

# Libreoffice
sudo apt remove libreoffice*

# Onlyoffice
TMP=$(mktemp -d)
cd $TMP

wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
sudo apt install ./onlyoffice-desktopeditors_amd64.deb -y

rm -rf $TMP
cd

# Git
git config --global core.editor "nvim"
git config --global init.defaultBranch main

# Done
sudo apt autoremove -y
cd
echo "Setup finished, run nvim, then :MasonInstallAll" 
