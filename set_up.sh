#!/bin/bash

# Stop execution if errors occur
set -e

# Install things
sudo apt update
sudo apt install vim nano ranger htop neovim -yy

# New .vimrc and .bashrc
if [[ -f "/home/$USER/.vimrc" ]]; then
        read -p "This operation will remove your current .vimrc. Proceed? (y/N): " inp1
        if [ "$inp1"=="y" ]; then
                rm ~/.vimrc
        fi
fi

if [[ -f "/home/$USER/.bashrc" ]]; then
        read -p "This operation will remove your current .bashrc. Proceed? (y/N): " inp2
        if [ "$inp2"=="y" ]; then
                rm ~/.bashrc
        fi
fi

cp vimrc init.vim
if [[ ! -d "/home/$USER/.config/nvim" ]]; then
        mkdir /home/$USER/.config/nvim
fi
mv init.vim ~/.config/nvim/
mv vimrc .vimrc
mv bashrc .bashrc
mv .vimrc ~
mv .bashrc ~

# Install plug-manager for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Set up completed"
exit
