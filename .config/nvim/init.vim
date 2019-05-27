filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

set hlsearch
set ignorecase
set smartcase

syntax on
set number relativenumber

" Use clipboard for buffer
set clipboard=unnamedplus

" Automatic writes
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
