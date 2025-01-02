return {
	"RRethy/vim-illuminate",
	config = function()
		-- Disable default keymaps
		vim.g.Illuminate_useDefaultMappings = false

		-- Debug version - let's see which one works
		vim.keymap.set("n", "<C-M-Up>", '<cmd>lua require("illuminate").goto_prev_reference()<cr>', {
			desc = "Move to previous reference",
		})
		-- Try alternative notation for Down
		vim.keymap.set("n", "<D-C-Down>", '<cmd>lua require("illuminate").goto_next_reference()<cr>', {
			desc = "Move to next reference",
		})
	end,
}
