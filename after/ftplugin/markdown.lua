-- soft-wrap prose at the window edge (global default is wrap = false)
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break at word boundaries, not mid-word
vim.opt_local.breakindent = true -- wrapped lines keep the indent of list items

-- move by visual line so j/k don't jump over wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true })
