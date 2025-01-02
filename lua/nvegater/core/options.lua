vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs prettier default
opt.expandtab = true -- expand tabs to spaces
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.autoindent = true -- copy indent from current line when startin a new one

opt.wrap = false
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in search, assumes you want case-sensitive

-- Current line shadow
opt.cursorline = true


-- turn on termguicolors for tokyionight colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes tha can be light or dark are Dark by default
opt.signcolumn = "yes" -- show sign column so that text doesnt shift

-- backspace 
opt.backspace = "indent,eol,start" -- backspace on indent, end of line or inset mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
