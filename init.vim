" Automatically install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin('~/.vim/plugged')

" editing
Plug 'tpope/vim-commentary'

" files
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" language servers
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git
Plug 'mhinz/vim-signify'

" ui
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()


" Neovim config
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

silent! colorscheme seoul256 " use silent! to avoid an error during installation
let g:lightline = { 'colorscheme': 'seoul256' }
set background=dark


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


" Tab navigation
map <C-t> :tabnew<CR>
map <C-q> :tabclose<CR>
map <C-n> :tabnext<CR>
map <C-b> :tabprevious<CR>


" Indentation
filetype plugin indent on
set tabstop=4    " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces


" fuzzy searching
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>


" autocompletion
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'nvim_lsp': v:true,
  \ }
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')


" lsp configuration
lua require'lspconfig'.rust_analyzer.setup({})
" lua require'lspconfig'.clangd.setup({})


" vim-commentary
nmap <leader>c <Plug>Commentary
vmap <leader>c <Plug>Commentary

" goyo - zen mode
let g:goyo_width = 100
let g:goyo_height = 100

function! s:goyo_enter()
    " by default goyo resets everything, but I still want to see the numbers
    " and the current line
    set number
    set cursorline
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()

nmap <leader>z :Goyo<CR>
