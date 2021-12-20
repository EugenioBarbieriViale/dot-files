"      _
"     (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

" basics {{
syntax on
filetype plugin indent on
set nocompatible
set filetype=off
set encoding=utf-8
set tabstop=4 shiftwidth=4
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
set foldenable
set foldmethod=marker
set foldmarker={{,}}

let mapleader = " "
" }}

" plugins {{
call plug#begin('~/.vim/autoload/')
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'morhetz/gruvbox'
Plug 'miyakogi/slateblue.vim'
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
Plug 'flazz/vim-colorschemes'
Plug 'psliwka/vim-smoothie'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" }}

" autocommands {{
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd vimEnter *.cpp map <leader>g :w <CR> !g++ %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
autocmd vimEnter *.cpp map <leader>z :w <CR> !g++ -S %CR>
autocmd vimEnter *.c map <leader>c :w <CR> !gcc %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
autocmd vimEnter *.sh map <leader>s :w <CR> !bash %; <CR>
autocmd vimEnter *.py map <leader>p :w <CR> !python3 %<CR>
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
autocmd BufNewFile *.py 0r ~/.vim/templates/init.py
autocmd BufNewFile *.sh 0r ~/.vim/templates/init.sh
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e
" }}

" shortcuts {{
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

" }}

" styling {{
highlight Comment cterm=italic
highlight SpellBad ctermbg=Red ctermfg=White
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=NONE cterm=bold ctermfg=NONE
highlight LineNr ctermbg=NONE ctermfg=NONE
highlight Folded cterm=bold ctermbg=Black ctermfg=White
" }}

" airline config {{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
" }}

" fzf config {{
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

map <leader>e :History<CR>
map <leader>f :Files<CR>
" }}

"C++ Class Generator {{
 function! Class(ClassName)
    "==================  editing header file =====================
     let header = a:ClassName.".h"
     call append(0,"#ifndef ".toupper(a:ClassName)."_H")
     call append(1,"#define ".toupper(a:ClassName)."_H")
     call append(2," ")
     call append(3,"class ".a:ClassName )
     call append(4, "{")
     call append(5, "   public:")
     call append(6, "      ".a:ClassName."();")
     call append(8, "   protected:")
     call append(9, "   private:")
     call append(10, "};")
     call append(11,"#endif // ".toupper(a:ClassName)."_H")
     :execute 'write' header
   "================== editing source file ========================
     let src    = a:ClassName.".cpp"
     call append(0,"#include ".a:ClassName.".h")
     call append(1," ")
     call append(2,a:ClassName."::".a:ClassName."()")
     call append(3,"{")
     call append(4,"//ctor ")
     call append(5,"}")
     :execute 'write' src
endfunction

command! -nargs=1 Class call Class(<f-args>)
" }}

" colorscheme {{
colorscheme default
" }}
