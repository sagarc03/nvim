vim.g.mapleader = " "

require("general")
require("treesitter")
require("packages")
require("statusline")
require("lsp")
require("root")
require("telescopeconfig")
require("tabbar")
require("mapping")
require("file_explorer")
require("dashboard")
require("term")
require("scope")
require("git")
require("wilder")

vim.notify = require("notify")

-- Lua
require("onedark").setup({
	style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "bold",
		strings = "italic",
		variables = "italic",
	},
})

-- setup must be called before loading
vim.cmd("colorscheme onedark")

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"

require("Comment").setup()
require("gitsigns").setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})

require("sniprun").setup({
	--# you can combo different display modes as desired
	display = {
		"NvimNotify", --# display with the nvim-notify plugin
	},
})
