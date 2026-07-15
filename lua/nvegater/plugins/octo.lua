return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	keys = {
		{ "<leader>ol", "<cmd>Octo pr list<CR>", desc = "Octo: list PRs" },
		{ "<leader>oc", "<cmd>Octo pr create<CR>", desc = "Octo: create PR" },
		{ "<leader>or", "<cmd>Octo review<CR>", desc = "Octo: start/resume PR review" },
		{ "<leader>os", "<cmd>Octo review submit<CR>", desc = "Octo: submit review" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({
			enable_builtin = true, -- bare :Octo opens a command picker
		})
	end,
}
