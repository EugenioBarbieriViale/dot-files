-- local colorscheme = "rose-pine"
local colorscheme = "silentium"

local schemes = {
	["silentium"] = {
		plugin = { "silentium-theme/silentium.nvim", name = "silentium" },
		config = function()
			local silentium = require("silentium")
			-- silentium.setup({ accent = silentium.accents.peach })
			silentium.setup()
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
				styles = { bold = true, italic = true, transparency = true },
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
