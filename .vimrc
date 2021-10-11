" enable syntax
syntax on

" tabs and indentation
set tabstop=4 shiftwidth=8 smarttab

" search words by typing when in normal mode: /word
set incsearch

" command-line completition menu (usage: tab)
set wildmenu

" path means a list of directories in which vim will search (:h path for more informations)
" open file by typing :find filename (directory name not needed)
set path+=**

call plug#begin('~/.vim/autoload/')
" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'

" tree explorer :NERDTree
Plug 'scrooloose/nerdtree'

" plugins for autocompletition
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
call plug#end()

" use terminal background (R=14,G=14,B=22)
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

" show NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" select colorscheme
colorscheme dracula   " onedark

" disable arrowkeys (when in normal mode, use hjkl to move)
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>