vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.tex",
	command = "0r ~/.vim/templates/skeleton.tex",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	pattern = "*.tex",
	callback = function()
		vim.cmd("SoftWrapMode")
	end,
})

-- open file with cursor at its last position
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line = mark[1]
		if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
			vim.cmd("normal! g'\"")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		if vim.bo[args.buf].filetype == "lean" then
			return
		end
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ async = false, id = args.data.client_id })
			end,
		})
	end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
-- 	callback = function(args)
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			buffer = args.buf,
-- 			callback = function()
-- 				vim.lsp.buf.format({ async = false, id = args.data.client_id })
-- 			end,
-- 		})
-- 	end,
-- })
