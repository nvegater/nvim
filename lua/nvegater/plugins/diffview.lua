return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			diff_binaries = false,
			enhanced_diff_hl = false,
			git_cmd = { "git" },

			keymaps = {
				view = {
					["<tab>"] = actions.select_next_entry,
					["<s-tab>"] = actions.select_prev_entry,
					["<leader>e"] = actions.toggle_files,
					["gf"] = actions.goto_file_edit,
					["<C-w><C-f>"] = actions.goto_file_split,
					["<C-w>gf"] = actions.goto_file_tab,
					["<leader>b"] = actions.toggle_files,
				},
				file_panel = {
					["j"] = actions.next_entry,
					["k"] = actions.prev_entry,
					["<cr>"] = actions.select_entry,
					["s"] = actions.toggle_stage_entry, -- Changed from stage_entry
					["u"] = actions.toggle_stage_entry, -- Changed from unstage_entry
					["R"] = actions.refresh_files,
					["<tab>"] = actions.select_next_entry,
					["<s-tab>"] = actions.select_prev_entry,
					["gf"] = actions.goto_file_edit,
					["<C-w><C-f>"] = actions.goto_file_split,
					["<C-w>gf"] = actions.goto_file_tab,
					["i"] = actions.listing_style,
					["f"] = actions.toggle_flatten_dirs,
				},
				file_history_panel = {
					["g!"] = actions.options,
					["<C-A-d>"] = actions.open_in_diffview,
					["y"] = actions.copy_hash,
					["L"] = actions.open_commit_log,
					["zR"] = actions.open_all_folds,
					["zM"] = actions.close_all_folds,
				},
			},

			view = {
				default = {
					layout = "diff2_horizontal",
					winbar_info = false,
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
					winbar_info = true,
				},
				file_history = {
					layout = "diff2_horizontal",
					winbar_info = false,
				},
			},

			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
				},
			},

			hooks = {
				diff_buf_read = function(bufnr)
					-- Set up any buffer-local keymaps or options
					vim.opt_local.wrap = false
					vim.opt_local.list = false
				end,
			},
		})

		-- Set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
		keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
		keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Open file history" })
		keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "Open current file history" })
	end,
}
