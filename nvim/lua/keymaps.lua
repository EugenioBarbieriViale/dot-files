vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "Y", "yy", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>n", ":bnext<cr>", opts)
keymap("n", "<leader>p", ":bprevious<cr>", opts)
keymap("n", "<leader>d", ":bdelete<cr>", opts)

keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gt", opts)

keymap("n", "<leader>s", ":source %<cr>", opts)
keymap("n", "<leader>e", ":Explore<cr>", opts)
keymap("n", "<leader>f", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>v", ":find ~/.config/nvim/init.lua<cr>", opts)

keymap("n", "<leader>r", ":term cargo run<cr>", opts)
keymap("n", "<leader>b", ":term cargo build<cr>", opts)
keymap("n", "<leader>h", ":term rustc %<cr>", opts)
keymap("n", "<leader>q", ":term python3 %<cr>", opts)
keymap("n", "<leader>c", ":term gcc % -o %:r<cr>", opts)
keymap("n", "<leader>g", ":term g++ % -o %:r<cr>", opts)
keymap("n", "<leader>a", ":term ./%:r<cr>", opts)
