"
" ~/.vimrc
"

execute pathogen#infect()

set nocompatible

filetype indent on
filetype plugin indent on
set autoindent
set cursorline
set expandtab
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set nobackup
set nohlsearch
set nowrap
set nowritebackup
set number
set ruler
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set smarttab
set softtabstop=4
set t_Co=256
set tabstop=8
set wildmenu
syntax enable
set relativenumber

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Theme
colorscheme molokai 
