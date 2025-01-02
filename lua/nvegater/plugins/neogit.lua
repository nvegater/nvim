return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			-- Disable remembering the last position of the commit message
			remember_settings = true,

			-- Integration with diffview.nvim
			integrations = {
				diffview = true,
			},

			-- Customize sections in the status buffer
			sections = {
				-- Hide the unstaged and staged changes sections by default
				untracked = {
					folded = false,
				},
				unstaged = {
					folded = false,
				},
				staged = {
					folded = false,
				},
			},

			-- Customize signs
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},

			-- Use valid status commands
			mappings = {
				status = {
					["<tab>"] = "Toggle",
					["A"] = "StageAll",
					["U"] = "UnstageStaged",
					["C"] = "Command", -- Changed from 'CommitPopup'
					["d"] = "Command", -- Changed from 'DiffPopup'
					["L"] = "Command", -- Changed from 'LogPopup'
					["P"] = "Command", -- Changed from 'Pull/Push'
				},
			},
		})

		-- Set keymaps for Neogit commands
		local keymap = vim.keymap
		keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Open Neogit status" })
		keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Open Neogit commit" })
		keymap.set("n", "<leader>gpl", "<cmd>Neogit pull<CR>", { desc = "Neogit pull" })
		keymap.set("n", "<leader>gps", "<cmd>Neogit push<CR>", { desc = "Neogit push" })
	end,
}
