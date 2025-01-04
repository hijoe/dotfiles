vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness 

opt.relativenumber = true -- show relative line numbers
opt.number = true -- show absolute line number on cursor line (when relative line number is on)

-- tabs and indentation 

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one 

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include a mixed case in your search, assumes you want case-sensitive 

-- appearance 

-- turn on termuicolors for colorschemes 
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- backspace 
opt.backspace = "indent,eol,start" -- allow backspace on ident, end of line or insert mode

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
