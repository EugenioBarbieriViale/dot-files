return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Format on save handler
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("Format", { clear = false }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, async = false })
						end,
					})
				end
			end,
		})

		local servers = {
			"eslint",
			"jsonls",
			"pyright",
			"ruff",
			"rust_analyzer",
			"clangd",
			"texlab",
			"gopls",
			"lua_ls",
			"opencl_ls",
			"ts_ls",
		}
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
			})
			vim.lsp.enable(server)
		end

		vim.diagnostic.enable = true
		vim.diagnostic.config({
			virtual_text = true,
			-- virtual_lines = true,
		})
	end,
}
