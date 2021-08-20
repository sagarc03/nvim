local o = vim.o
local g = vim.g


o.syntax = 'on'
o.hidden = true
o.wrap = false

-- Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Line numbers
o.number = true
o.relativenumber = true

-- Splits
o.splitbelow = true
o.splitright = true

-- TABS and Indents
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.shiftround = true
o.smarttab = true
o.expandtab = true
o.smartindent = true
o.autoindent = true

--Top tab line
o.showtabline = 2

-- Vim compe
vim.o.completeopt = "menuone,noselect"


o.termguicolors = true

g.loaded_python_provider = 0
g.python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'