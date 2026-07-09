vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "In insert mode, exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- line movement mappings
keymap.set("n", "<A-S-Up>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("n", "<A-S-Down>", ":m .+1<CR>==", { desc = "Move line down" })
-- keymap.set("v", "<A-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" }) -- Interferes with incremenetal_selection from treesitter
-- keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
keymap.set("v", "<A-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- jump to tab by number (goes to last tab if the number doesn't exist)
for i = 1, 9 do
	keymap.set("n", "<leader>t" .. i, i .. "gt", { desc = "Go to tab " .. i })
end

-- Warp integration
keymap.set("n", "<leader>tw", function()
  vim.fn.jobstart({ "open", "warp://action/new_tab?path=" .. vim.uri_encode(vim.fn.getcwd()) }, { detach = true })
end, { desc = "Open Warp tab in cwd" })

-- Convert tabs to splits
keymap.set("n", "<leader>th", "<cmd>tab split | tabclose #<CR>", { desc = "Convert next tab to horizontal split" })
keymap.set("n", "<leader>tv", "<cmd>vert tab split | tabclose #<CR>", { desc = "Convert next tab to vertical split" })

-- IntelliJ-style smart select (extend/shrink selection), like Option+Up/Down in IJ.
-- Built on Neovim 0.12's native treesitter node selection (:h v_an), which
-- falls back to LSP selection range when no parser is available.
-- Warp only sends Meta for the RIGHT Option key (left Option composes German
-- QWERTZ symbols, see ~/.warp/settings.toml extra_meta_keys), so left-Option+k/j
-- reach nvim as the literal characters ∆/º — map those too so either Option works.
keymap.set("n", "<A-Up>", "van", { remap = true, desc = "Smart select: start" })
keymap.set("x", "<A-Up>", "an", { remap = true, desc = "Smart select: expand" })
keymap.set("x", "<A-Down>", "in", { remap = true, desc = "Smart select: shrink" })
for _, lhs in ipairs({ "<A-k>", "∆" }) do
	keymap.set("n", lhs, "van", { remap = true, desc = "Smart select: start" })
	keymap.set("x", lhs, "an", { remap = true, desc = "Smart select: expand" })
end
for _, lhs in ipairs({ "<A-j>", "º" }) do
	keymap.set("x", lhs, "in", { remap = true, desc = "Smart select: shrink" })
end

-- Delete without yanking (black hole register)
keymap.set("n", "<leader>dw", '"_dw', { desc = "Delete word forward without yanking" })
keymap.set("n", "<leader>de", '"_de', { desc = "Delete word to end without yanking" })
keymap.set("n", "<leader>db", '"_db', { desc = "Delete word backward without yanking" })
keymap.set("n", "<leader>diw", '"_diw', { desc = "Delete inner word without yanking" })
keymap.set("n", "<leader>daw", '"_daw', { desc = "Delete a word without yanking" })
keymap.set("n", "<leader>dd", '"_dd', { desc = "Delete line without yanking" })
keymap.set("v", "<leader>d", '"_d', { desc = "Delete selection without yanking" })
