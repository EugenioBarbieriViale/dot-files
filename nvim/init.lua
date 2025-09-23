require "keymaps"
require "plugins"
require "lualine_config"
require "lsp"

local set = vim.opt
local g = vim.g

set.relativenumber = true
set.mouse = ""
set.tabstop = 4
set.shiftwidth = 4
set.termguicolors = true

g.netrw_banner = 0
g.vimtex_view_method = "zathura"
g.vimtex_compiler_method = 'tectonic'


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

vim.cmd([[autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE]])

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
