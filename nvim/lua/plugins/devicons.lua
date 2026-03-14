-- https://www.nerdfonts.com/cheat-sheet

return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				bash = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Bash",
				},
			},
			color_icons = true,
			default = true,
			strict = true,
			-- set the light or dark variant manually, instead of relying on `background`
			-- (default to nil)
			variant = "light|dark",
			blend = 0,
			-- same as `override` but specifically for overrides by extension
			-- takes effect when `strict` is true
			override_by_extension = {
				["lean"] = {
					icon = "󰿉",
					color = "#710193",
					name = "Lean",
				},
			},
		})
	end,
}
