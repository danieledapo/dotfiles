"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dein')
  call dein#begin('~/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dein/repos/github.com/Shougo/dein.vim')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('jacoborus/tender')
  call dein#add('jremmen/vim-ripgrep')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


if has('nvim')
  let g:python_host_prog=expand('~/.virtualenvs/neovim/bin/python')
  let g:python3_host_prog=expand('~/.virtualenvs/neovim3/bin/python')
endif


filetype plugin on    " enable file type plugins
filetype indent on    " enable file type indentation


" Map leader

let mapleader = ","
let g:mapleader = ","


" Files

set autoread    " auto read changed files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.svn/* " ignore some files


" Editing

set backspace=eol,start,indent      " enable backspace on eol, sol and indentation

autocmd BufWritePre * %s/\s\+$//e   " remove trailing whitespaces


" Copy and Paste to OS clipboard

nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p


" Smart search

set hlsearch
set ignorecase
set incsearch
set smartcase

set lazyredraw


" Colors and UI

syntax enable

if (has("termguicolors"))
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme tender
let g:airline_theme = 'tender'

set ruler             " show ruler

set number            " show numbers
set relativenumber    " relative line numbers
set cursorline        " highlight line
set showmatch         " highlight matching parens, bracket,...


" Indentation

set expandtab        " tab to spaces
set smarttab
set tabstop=4        " number of spaces per TAB
set softtabstop=4    " number of spaces when editing
set autoindent
set smartindent


" Navigation

" navigate between splits easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" NerdTree

map <leader>t :NERDTreeToggle<CR>

" quit if NerdTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NerdCommenter

noremap <leader>c :call NERDComment(0,"toggle")<CR>


" Ctrlp

if executable('rg') && !exists('g:ctrlp_user_command')
  let g:ctrlp_user_command = 'rg %s --files'
endif

