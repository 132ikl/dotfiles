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
Plug 'junegunn/goyo.vim'
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-surround'
Plug 'cskeeters/vim-smooth-scroll'
Plug 'fisadev/vim-isort'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'junegunn/goyo.vim'
Plug 'rust-lang/rust.vim'
Plug 'wlangstroth/vim-racket'
Plug 'frazrepo/vim-rainbow'
Plug 'AndrewRadev/id3.vim'
" Plug 'vim-syntastic/syntastic'
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
map <leader>c gcc
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
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
" Terminal stuff
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
map <leader>t :Tnew<CR>
map <leader>; :let build_command="
nnoremap <silent> <C-n> :wa<bar>:Tkill<bar>:execute "T " . build_command<CR>
" qutebrowser tabs 
nnoremap <silent> J :bp<CR>
nnoremap <silent> K :bn<CR>
" easy nav
map <leader>s <C-u>
map <leader>d <C-d>

" incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Automatic commands
au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
au BufWritePost *Xresources !xrdb %
au BufWritePost config.h !make -C %:p:h
" NERDTree aus
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" auto code fmt
augroup autoformat_settings
  au FileType bzl AutoFormatBuffer buildifier
  au FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  au FileType dart AutoFormatBuffer dartfmt
  au FileType go AutoFormatBuffer gofmt
  au FileType gn AutoFormatBuffer gn
  au FileType html,css,sass,scss,less,AutoFormatBuffer js-beautify
  au FileType java AutoFormatBuffer google-java-format
  au FileType python AutoFormatBuffer black
  au FileType rust AutoFormatBuffer rustfmt
  au FileType vue AutoFormatBuffer prettier
augroup END

au BufReadPost *.rkt,*.rktl set filetype=racket
au FileType racket set lisp
au FileType racket set autoindent
au BufEnter *.rkt,*.rktl call rainbow#load()

" ignore virtualenv
let g:python_host_prog='/usr/bin/python'

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

let g:goyo_width=85

" syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
