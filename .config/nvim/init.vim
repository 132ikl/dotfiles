let mapleader=","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'python/black'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'cskeeters/vim-smooth-scroll'
call plug#end()

" General display and tab stuff
filetype plugin indent on
set hidden
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set hlsearch
set ignorecase
set smartcase
set number relativenumber

" Conveinence binds
map <C-L> :Black<CR>
map <leader>c gcc
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
map <leader>t :belowright 10split \| :terminal<CR> 
tnoremap <Esc> <C-\><C-n>
" hjkl window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" Xorg clipboard register
map <C-c> "+
" Save all and run last command
map <C-;> :wa<CR> <bar> :!!<CR>
" qutebrowser tabs 
nnoremap <silent> J :bp<CR>
nnoremap <silent> K :bn<CR>
" easy nav
map <leader>s <C-u>
map <leader>d <C-d>

" Automatic commands
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
" NERDTree autocmds
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" don't know why this doesn't work without autocmd?
autocmd FileType python :hi semshiSelected ctermfg=none guifg=none ctermbg=none guibg=none cterm=bold gui=bold

" A E S T E T I C
let g:lightline = {'colorscheme': 'onedark'}
syntax on
" Copy paste thing from onedark
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark
