return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
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
			theme = "dragon", -- The dragon variant is the darkest
			background = {
				dark = "dragon",
				light = "lotus"
			},
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none"
						}
					}
				}
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					-- Make the cursor very visible against the dark background
					Cursor = { fg = theme.ui.bg, bg = theme.ui.fg },
					-- Enhanced cursor line visibility
					CursorLine = { bg = theme.ui.bg_p1 },
				}
			end,
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
