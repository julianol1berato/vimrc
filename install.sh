#!/bin/bash
# install linux

# Update package list and install vim, git, and curl
sudo apt update
sudo apt install -y vim git curl

# Clone the lightline.vim plugin into the appropriate directory
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

# Create or overwrite the .vimrc file with the desired configuration
cat << EOF > ~/.vimrc
call plug#begin()
Plug 'itchyny/lightline.vim'
call plug#end()

set laststatus=2

set fileformats=unix,dos,mac
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set ruler
set encoding=utf-8
syntax on
EOF

# Install vim-plug if it is not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Source the .vimrc and install plugins
vim +PlugInstall +qall
