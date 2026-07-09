-- Project picker fed by the `alias name='cd <path>'` lines in ~/.zshrc,
-- so terminal aliases and this picker share one source of truth.
-- Picking a project opens it in a new tab (tab-local cwd) and starts find_files.

local M = {}

local function parse_zshrc_projects()
	local projects = {}
	local zshrc = vim.fn.expand("~/.zshrc")
	if vim.fn.filereadable(zshrc) == 0 then
		return projects
	end
	for _, line in ipairs(vim.fn.readfile(zshrc)) do
		local name, path = line:match("^alias%s+([%w%-_%.]+)=['\"]cd%s+([^'\"%s]+)")
		if name and path then
			table.insert(projects, { name = name, path = vim.fn.expand(path) })
		end
	end
	return projects
end

function M.open_project()
	local projects = parse_zshrc_projects()
	if #projects == 0 then
		vim.notify("No `cd` aliases found in ~/.zshrc", vim.log.levels.WARN)
		return
	end
	vim.ui.select(projects, {
		prompt = "Open project",
		format_item = function(item)
			return item.name .. "  →  " .. vim.fn.fnamemodify(item.path, ":~")
		end,
	}, function(choice)
		if not choice then
			return
		end
		if vim.fn.isdirectory(choice.path) == 0 then
			vim.notify("Not a directory: " .. choice.path, vim.log.levels.ERROR)
			return
		end
		vim.cmd.tabnew()
		vim.cmd.tcd(vim.fn.fnameescape(choice.path))
		require("telescope.builtin").find_files()
	end)
end

vim.keymap.set("n", "<leader>fp", M.open_project, { desc = "Open project in new tab (zsh aliases)" })

return M
