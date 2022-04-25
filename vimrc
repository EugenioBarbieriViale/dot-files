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
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'morhetz/gruvbox'
Plug 'miyakogi/slateblue.vim'
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" autocommands
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e

" shortcuts
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

nnoremap <silent> j :normal! gj<CR>
nnoremap <silent> k :normal! gk<CR>

map <silent> <leader>v :find ~/.config/nvim/init.vim<CR>
map <silent> <leader>b :find ~/.bashrc<CR>
map <silent> <leader>t :vsplit term://bash<CR>
map <leader>da ggVGd<CR>
map <leader>s :source %<CR>
map <leader>w :w<CR>
map <leader>ex :!chmod +x %<CR>

noremap <Tab> gt
noremap <S-Tab> gT
noremap <silent> <A-n> :tabnew<CR>
noremap <silent> <A-,> :tabmove -<CR>

noremap <silent> <A-.> :tabmove +<CR>
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" styling
highlight Comment cterm=italic
highlight SpellBad ctermbg=Red ctermfg=White
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=NONE cterm=bold ctermfg=NONE
highlight LineNr ctermbg=NONE ctermfg=NONE
highlight Folded cterm=bold ctermbg=Black ctermfg=White

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

" fzf config
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

map <leader>e :History<CR>
map <leader>f :Files<CR>

colorscheme gruvbox
