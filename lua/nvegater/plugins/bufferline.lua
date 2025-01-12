return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			name_formatter = function(buf)
				local path = vim.fn.fnamemodify(buf.path, ":~:.")
				-- If the path is too long, show the last parts
				if #path > 40 then
					-- Split by path separator and take last 2-3 parts
					local parts = vim.split(path, "/")
					return table.concat(parts, "/", math.max(1, #parts - 2))
				end
				return path
			end,
			show_buffer_close_icons = false,
			show_close_icon = false,
			enforce_regular_tabs = true,
			max_name_length = 80, -- Increased from default
			truncate_names = false, -- Don't truncate
			tab_size = 40, -- Make tabs wider
		},
	},
}
