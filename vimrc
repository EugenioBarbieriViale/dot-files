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
set encoding=UTF-8
set tabstop=4
set shiftwidth=4 softtabstop=4
set expandtab
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

" IN ORDER TO HAVE DEVICONS WORKING, YOU HAVE TO USE A NERD FONT
" plugins
call plug#begin('~/.vim/autoload/')
Plug 'raimondi/delimitmate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment and uncomment things by typing 'gcc'
Plug 'vim-airline/vim-airline' " status/tabline
Plug 'vim-airline/vim-airline-themes' " collection of themes for vim-airline
Plug 'ryanoasis/vim-devicons' " add filetype glyphs (icons) to various vim plugins
Plug 'lervag/vimtex' " latex support and compiling from Vim

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tinted-theming/base16-vim'
Plug 'aditya-azad/candle-grey'
call plug#end()

" use terminal background and not the colorscheme's one
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

" remove different color of numbers
autocmd ColorScheme * highlight! clear LineNr

" change highlighted text
autocmd ColorScheme * highlight! Visual cterm=none ctermbg=darkgrey ctermfg=none

" change autocompletition color
autocmd ColorScheme * highlight! Pmenu ctermbg=darkgray guibg=darkgray
autocmd ColorScheme * highlight! StatusLine ctermbg=darkgray guibg=darkgray

" when opening a file, position the cursor at last position
autocmd VimEnter * '"

" easly travel between tabs
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" resize tabs
" map <S-C-l> :vertical resize -2<CR>
" map <S-C-h> :vertical resize +2<CR>
" map <S-C-k> :resize +2<CR>
" map <S-C-j> :resize -2<CR>

" handy shortcuts
map <leader>e :Explore<CR>
map <leader>f :find 
map <leader>t :tabnew<CR>

map <leader>b :!make<CR>
map <leader>c :!gcc %<CR>
map <leader>a :term ./a.out<CR>
map <leader>p :term python3 %<CR>

map <leader>n :bnext<cr>
map <leader>d :bdelete<cr>

map <silent> <leader>v :find ~/.vimrc<CR>
map <leader>s :source %<CR>

" move between tabs by using the tab or Shift+tab buttons
noremap <Tab> gt
noremap <S-Tab> gT

" --- airline ---
" airline theme
let g:airline#extensions#tabline#enabled = 1 " enable buffers
" let g:airline_theme='wombat'
" let g:airline_theme='powerlineish'
let g:airline_theme='distinguished'
" let g:airline_theme='simple'
" let g:airline_theme='term'

" airline upper section style
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

let g:airline_section_z = 'lazzy'
let g:airline_section_error = ''
let g:airline_section_warning = ''

" remove banner from netrw
let g:netrw_banner = 0

" add italic for monokai colorscheme
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

colorscheme candle-grey-transparent
