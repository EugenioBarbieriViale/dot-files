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
set.termguicolors = true

g.vimtex_view_method = "zathura"
g.vimtex_compiler_method = "tectonic"

-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1
g.netrw_banner = 0


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

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  ingore_install = { "latex" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    -- disabled languages
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}

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
vim.cmd([[autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | :NvimTreeOpen | endif]])

-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme rose-pine]])
vim.cmd([[colorscheme kanagawa]])
