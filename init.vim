" Automatically install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin('~/.vim/plugged')

" files
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" language servers
Plug 'w0rp/ale'

" editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" git
Plug 'mhinz/vim-signify'

" misc
Plug 'leafgarland/typescript-vim'

" ui
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'

call plug#end()


" Neovim config
let g:python_host_prog = "/home/daniele/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/home/daniele/.pyenv/versions/neovim3/bin/python"


" Map leader
let mapleader = ","
let g:mapleader = ","

" Files
set autoread    " auto read changed files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.svn/* " ignore some files


" Editing
set backspace=eol,start,indent      " enable backspace on eol, sol and indentation


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


" UI
set lazyredraw


" Theme and colorscheme
set termguicolors
set background=dark
silent! colorscheme one " use silent! to avoid an error during installation
let g:lightline = { 'colorscheme': 'one' }


" Lines and columns
set ruler             " show ruler
set number            " show numbers
set cursorline        " highlight line
set showmatch         " highlight matching parens, bracket,...
set nowrap            " do not wrap lines

" Split navigation
set splitright
set splitbelow
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Indentation
filetype plugin indent on
set tabstop=4    " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces

" ale configuration
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'rust': ['rustfmt'],
            \ 'haskell': ['brittany'],
            \ }
let g:ale_linters = {
            \ 'rust': ['rls'],
            \ 'haskell': ['hlint', 'stack-build'],
            \ }


" Search
let $FZF_DEFAULT_COMMAND = "rg --files"
let g:fzf_layout = { 'down': '~20%' }
map <C-p> :Files<CR>
map <C-f> :Rg<space>


" NerdTree
map <leader>t :NERDTreeToggle<CR>

" quit if NerdTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" vim-commentary
nmap <leader>c <Plug>Commentary
vmap <leader>c <Plug>Commentary
