local o = vim.o
local g = vim.g

o.hidden = true
o.wrap = false

-- Clipboard
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set signcolumn=auto:2")

-- fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
vim.wo.fillchars = "fold:\\"
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

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

o.termguicolors = true

g.loaded_python_provider = 0
g.python3_host_prog = vim.env.HOME .. "/.pyenv/versions/py3nvim/bin/python"
g["coq_settings"] = {
	keymap = {
		recommended = true,
		jump_to_mark = "<C-n>",
	},
}
