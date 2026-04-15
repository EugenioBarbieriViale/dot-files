local vim = vim
local set = vim.opt
local g = vim.g

set.number = true
set.relativenumber = true
set.mouse = "nv"
set.tabstop = 2
set.shiftwidth = 2
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
set.termguicolors = true
set.fillchars = { eob = " " }
set.shm = "I"
set.laststatus = 3

g.netrw_banner = 0
g.netrw_winsize = 20
