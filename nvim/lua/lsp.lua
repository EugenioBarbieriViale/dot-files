require("mason").setup({
    ui = {
		border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },

	pip = {
		upgrade_pip = true,
	}
})

vim.diagnostic.config({
  virtual_text = true,
})

vim.diagnostic.open_float()

vim.lsp.config("lua-language-server", {
	cmd = {"lua-language-server", "--stdio"},
	filetypes = {"lua"},
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")
vim.lsp.enable("lua-language-server")
