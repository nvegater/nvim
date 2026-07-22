return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gs", "<cmd>LazyGit<CR>", desc = "Open LazyGit (status, commit, push, log)" },
		{ "<leader>gl", "<cmd>LazyGitFilter<CR>", desc = "LazyGit: browse repo commits" },
		{ "<leader>gc", "<cmd>LazyGitFilterCurrentFile<CR>", desc = "LazyGit: commits for current file" },
	},
	init = function()
		-- Floating window size (fraction of the editor)
		vim.g.lazygit_floating_window_scaling_factor = 0.9
		vim.g.lazygit_floating_window_use_plenary = 0
	end,
	config = function()
		-- Pressing 'e' in lazygit opens the file in a new tab (nvim-remote preset,
		-- :tab drop), but when the float closes the plugin restores focus to the
		-- old tab, leaving the new one unselected. Track any tab entered while
		-- lazygit is open and jump to it once the float is gone.
		local state = { home_tab = nil, target_tab = nil }
		local group = vim.api.nvim_create_augroup("LazyGitEditTabFocus", { clear = true })

		vim.api.nvim_create_autocmd("TermOpen", {
			group = group,
			pattern = "term://*lazygit*",
			callback = function()
				state.home_tab = vim.api.nvim_get_current_tabpage()
				state.target_tab = nil
			end,
		})

		vim.api.nvim_create_autocmd({ "TabNew", "TabEnter" }, {
			group = group,
			callback = function()
				if not state.home_tab then
					return
				end
				local tab = vim.api.nvim_get_current_tabpage()
				if tab ~= state.home_tab then
					state.target_tab = tab
				end
			end,
		})

		vim.api.nvim_create_autocmd("TermClose", {
			group = group,
			pattern = "term://*lazygit*",
			callback = function()
				-- The remote :tab drop and the plugin's focus-restore can land
				-- shortly after the terminal exits, so keep recording briefly
				-- and only then decide where to jump.
				vim.defer_fn(function()
					local target = state.target_tab
					state.home_tab, state.target_tab = nil, nil
					if
						target
						and vim.api.nvim_tabpage_is_valid(target)
						and target ~= vim.api.nvim_get_current_tabpage()
					then
						vim.api.nvim_set_current_tabpage(target)
					end
				end, 150)
			end,
		})
	end,
}
