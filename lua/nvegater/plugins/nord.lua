return {
	"shaunsingh/nord.nvim",
	priority = 1000, -- ensures it loads first
	config = function()
		-- Example configuration for Nord
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require("nord").set()

		-- Additional customization can go here
		-- For example, you can override specific highlight groups
		vim.cmd([[
      augroup NordOverrides
        autocmd!
        autocmd ColorScheme nord highlight Normal guibg=NONE ctermbg=NONE
      augroup END
    ]])

		-- Set colorscheme after the overrides
		vim.cmd("colorscheme nord")
	end,
}
