vim.cmd([[autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex]])

-- open file with cursor at its last position
vim.cmd([[autocmd VimEnter * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]])
