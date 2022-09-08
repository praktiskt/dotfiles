set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

set cmdheight=2
set updatetime=50
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'ray-x/go.nvim'
Plug 'beauwilliams/statusline.lua'
call plug#end()

autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
