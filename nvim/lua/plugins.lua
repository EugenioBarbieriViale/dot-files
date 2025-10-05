local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("raimondi/delimitmate")
Plug("tpope/vim-commentary")
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("ellisonleao/gruvbox.nvim")
Plug("rose-pine/neovim")
Plug("rebelot/kanagawa.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("akinsho/bufferline.nvim")
Plug("lervag/vimtex")

Plug("mason-org/mason.nvim")
Plug("neovim/nvim-lspconfig")
Plug("supermaven-inc/supermaven-nvim")

vim.call("plug#end")
