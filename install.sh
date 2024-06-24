#!/bin/bash
# install curl -sSL https://raw.githubusercontent.com/julianol1berato/vimrc/main/install.sh | bash

# Update package list and install vim, git, and curl
sudo apt update
sudo apt install -y vim git curl

echo 'HISTTIMEFORMAT="%d/%m/%Y - %T => "' >> ~/.bashrc
echo "HISTSIZE=50000" >> ~/.bashrc
echo "HISTFILESIZE=100000" >> ~/.bashrc
echo "shopt -s histappend" >> ~/.bashrc
echo "export HISTCONTROL=ignoredups:erasedups" >> ~/.bashrc
cp ~/.bashrc{,.orig}
echo "PS1='\[\033[00;32m\]┌─[\[\033[00;31m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00;32m\]]──[\[\033[01;33m\]\A\[\033[00;32m\]]──[\[\033[00m\]\w\[\033[00;32m\]]\n└─[\!]─>\$\[\033[00;32m\] '" >> ~/.bashrc

# Clone the lightline.vim plugin into the appropriate directory
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

# Create or overwrite the .vimrc file with the desired configuration
cat << EOF > ~/.vimrc
call plug#begin('~/.vim/plugged')

Plug 'kwsp/halcyon-neovim'
Plug 'itchyny/lightline.vim'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'halcyon',
      \ }

syntax on
colorscheme halcyon

" Configurações de aparência
set background=dark
set number
set relativenumber
set cursorline
set showcmd
set showmode
set wrap
set linebreak
set termguicolors

" Configurações de indentação
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Configurações de busca
set ignorecase
set smartcase
set incsearch
set hlsearch

" Configurações de interface
set ruler
set wildmenu
set wildmode=longest,list
set showtabline=2
set laststatus=2

" Configurações de arquivo
set fileencoding=utf-8
set fileformats=unix,dos,mac

" Configurações de desempenho
set lazyredraw
set ttyfast

EOF

# Install vim-plug if it is not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Source the .vimrc and install plugins
vim +'PlugInstall --sync' +qa
