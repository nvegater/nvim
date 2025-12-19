return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local lga_actions = require("telescope-live-grep-args.actions")
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")
		local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

		-- Custom actions
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "absolute" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
						["<S-CR>"] = actions.select_vertical, -- Opens in vertical split
						["<C-S-CR>"] = actions.select_horizontal, -- Opens in horizontal split
					},
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
							["<C-space>"] = actions.to_fuzzy_refine, -- freeze list and start fuzzy search
						},
					},
					-- Additional live_grep configuration
					additional_args = function(opts)
						return {
							"--hidden", -- Search in hidden files
							"--glob",
							"!**/.git/*", -- Exclude .git directory
						}
					end,
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- Basic telescope mappings
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		-- Live grep args mappings
		keymap.set(
			"n",
			"<leader>fg",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Find string in cwd with args" }
		)

		-- Live grep shortcuts
		keymap.set("n", "<leader>fw", live_grep_args_shortcuts.grep_word_under_cursor, {
			desc = "Grep word under cursor",
		})
		keymap.set("n", "<leader>fW", function()
			live_grep_args_shortcuts.grep_word_under_cursor({ postfix = " -t" })
		end, {
			desc = "Grep word under cursor (with file type)",
		})
		keymap.set("n", "<leader>fb", live_grep_args_shortcuts.grep_word_under_cursor_current_buffer, {
			desc = "Grep word under cursor in current buffer",
		})
		keymap.set("v", "<leader>fv", live_grep_args_shortcuts.grep_visual_selection, {
			desc = "Grep visual selection",
		})
		keymap.set("v", "<leader>fV", live_grep_args_shortcuts.grep_word_visual_selection_current_buffer, {
			desc = "Grep visual selection in current buffer",
		})
	end,
}
