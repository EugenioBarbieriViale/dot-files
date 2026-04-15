local colorscheme = "rose-pine"
-- local colorscheme = "kanagawa"

local schemes = {
	["kanagawa"] = {
		plugin = { "rebelot/kanagawa.nvim", name = "kanagawa" },
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				colors = { palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} } },
				overrides = function(_)
					return {}
				end,
				theme = "wave",
				background = { dark = "wave", light = "lotus" },
			})
		end,
	},
	["rose-pine"] = {
		plugin = { "rose-pine/neovim", name = "rose-pine" },
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				styles = { bold = true, italic = true, transparency = false },
			})
		end,
	},
}

local selected = schemes[colorscheme]

return vim.tbl_extend("force", selected.plugin, {
	config = function()
		selected.config()
		vim.cmd([[autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE]])
		vim.cmd([[autocmd ColorScheme * highlight! LineNr ctermbg=NONE guibg=NONE]])
		vim.cmd("colorscheme " .. colorscheme)
	end,
})
