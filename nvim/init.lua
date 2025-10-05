require "keymaps"
require "plugins"
require "lualine_config"
require "lsp"

local vim = vim
local set = vim.opt
local g = vim.g

set.number = true
set.relativenumber = true
set.mouse = ""
set.tabstop = 4
set.shiftwidth = 4
set.termguicolors = true
set.hlsearch = false
set.expandtab = true
set.smartcase = true
set.scrolloff = 4
set.wildmenu = true
set.undofile = true
set.smartindent = true
set.autoindent = true
set.cursorline = true
set.completeopt = { "menuone", "noselect", "popup" }
set.undofile = true

g.netrw_banner = 0
g.vimtex_view_method = "zathura"
g.vimtex_compiler_method = "tectonic"

require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
})

require("bufferline").setup{}

-- use terminal color as background
vim.cmd([[autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE]])

-- use terminal color as background for line numbers
vim.cmd([[autocmd ColorScheme * highlight! LineNr ctermbg=NONE guibg=NONE]])

-- load template for tex files
vim.cmd([[autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex]])

-- open file with cursor to the last position
vim.cmd([[autocmd VimEnter * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]])

-- if no file is opened, open the explorer
vim.cmd([[autocmd StdinReadPre * let g:isReadingFromStdin = 1]])
vim.cmd([[autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | :Explore | endif]])

-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme rose-pine]])
vim.cmd([[colorscheme kanagawa]])
