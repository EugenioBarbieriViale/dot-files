"      _
"     (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

" basics
syntax on
filetype plugin indent on
set nocompatible
set filetype=off
set encoding=utf-8
set tabstop=4
set shiftwidth=4 softtabstop=4
set noexpandtab
set incsearch
set wildmenu
set path+=**
set nu relativenumber
set scrolloff=4
set splitbelow splitright
set showmatch
set smartcase
set clipboard+=unnamed
set spelllang=en_us
set bg=dark
set undofile
set smartindent autoindent

let mapleader = " "

" plugins
call plug#begin('~/.vim/autoload/')
Plug 'preservim/nerdtree' " file system explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " adds syntax for nerdtree on most common file extensions
Plug 'raimondi/delimitmate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'flazz/vim-colorschemes' " list of lots of colorschemes
Plug 'tpope/vim-commentary' " comment and uncomment things by typing 'gcc'
Plug 'vim-airline/vim-airline' " status/tabline
Plug 'vim-airline/vim-airline-themes' " collection of themes for vim-airline
Plug 'ryanoasis/vim-devicons' " add filetype glyphs (icons) to various vim plugins
Plug 'junegunn/fzf' " fuzzy finder to search and open files
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
call plug#end()

" use terminal background and not the colorscheme's one
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

" when opening a file, position the cursor at last position
autocmd VimEnter * '"

" easly travel between tabs
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" treat lines that occupy more rows as a single one
nnoremap <silent> j :normal! gj<CR>
nnoremap <silent> k :normal! gk<CR>

" travel easly between these files (for nvim: ~/.config/nvim/init.vim)
map <silent> <leader>v :find ~/.vimrc<CR>
map <silent> <leader>b :find ~/.bashrc<CR>
map <silent> <leader>z :find ~/.zshrc<CR>

" source current file
map <leader>s :source %<CR>

" open new tab
noremap <leader>t :tabnew <CR>

" move between tabs by using the tab or Shift+tab buttons
noremap <Tab> gt
noremap <S-Tab> gT

" resize tab
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" --- airline ---
" airline theme
let g:airline_theme='minimalist'
" airline upper section style
let g:airline#extensions#tabline#formatter = 'unique_tail'

" --- NERDTree ---
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nnoremap <leader>n :NERDTree<CR>

map <leader>e :History<CR>
map <leader>f :Files<CR>

colorscheme dark
