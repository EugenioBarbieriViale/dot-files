vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("n", "Y", "yy", opts)
keymap("v", "<C-y>", '"+y', opts)
keymap("x", "<leader>p", '"_dP', opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<S-C-k>", ":resize +2<cr>", opts)
keymap("n", "<S-C-j>", ":resize -2<cr>", opts)
keymap("n", "<S-C-h>", ":vertical resize +2<cr>", opts)
keymap("n", "<S-C-l>", ":vertical resize -2<cr>", opts)

keymap("n", "<leader>n", ":bnext<cr>", opts)
keymap("n", "<leader>p", ":bprevious<cr>", opts)
keymap("n", "<leader>d", ":bdelete<cr>", opts)

keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gt", opts)

keymap("n", "<leader>e", ":Explore<cr>", opts)
keymap("n", "<leader>f", ":Telescope find_files<cr>", opts)
keymap("n", "<C-f>", ":Telescope oldfiles<cr>", opts)

keymap("n", "<leader>cr", ":term cargo run<cr>", opts)
keymap("n", "<leader>ch", ":term rustc %<cr>", opts)
keymap("n", "<leader>cq", ":term python3 %<cr>", opts)
keymap("n", "<leader>cc", ":term gcc % -o %:r<cr>", opts)
keymap("n", "<leader>ci", ":term g++ % -o %:r<cr>", opts)
keymap("n", "<leader>ca", ":term ./%:r<cr>", opts)
keymap("n", "<leader>cb", ":term ./build.sh<cr>", opts)
keymap("n", "<leader>cm", ":term bash %<cr>", opts)
keymap("n", "<leader>cg", ":term go run .<cr>", opts)

keymap("n", "<leader>ws", "<Plug>(wrapping-soft-wrap-mode)", opts)
keymap("n", "<leader>wh", "<Plug>(wrapping-hard-wrap-mode)", opts)
keymap("n", "<leader>wt", "<Plug>(wrapping-toggle-wrap-mode)", opts)
