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
set backup
set undofile
set swapfile

" Configurações de desempenho
set lazyredraw
set ttyfast
