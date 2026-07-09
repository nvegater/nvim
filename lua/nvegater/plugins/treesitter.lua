-- nvim-treesitter "main" branch (the rewrite): the old module system
-- (highlight/indent/incremental_selection + ensure_installed opts) is gone.
-- Parsers are installed explicitly and highlighting starts via vim.treesitter.start().
-- Smart select (Option+Up/Down) lives in core/keymaps.lua on top of the
-- Neovim 0.12 built-in node selection (:h treesitter-incremental-selection).
local languages = {
	"json",
	"javascript",
	"typescript",
	"tsx",
	"yaml",
	"html",
	"css",
	"prisma",
	"markdown",
	"markdown_inline",
	"python",
	"svelte",
	"graphql",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"query",
	"vimdoc",
	"c",
	"c_sharp",
	"rust",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter").install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvegater.treesitter", { clear = true }),
			desc = "Start treesitter highlighting and indentation",
			callback = function(ev)
				-- fails (silently) for filetypes without an installed parser
				if not pcall(vim.treesitter.start, ev.buf) then
					return
				end
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
