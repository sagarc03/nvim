vim.g.mapleader = " "

require("general")
require("treesitter")
require("packages")
require("lsp")
require("statusline")
require("root")
require("telescopeconfig")
require("tabbar")
require("mapping")
require("file_explorer")
require("dashboard")
require("term")
require("scope")
require("git")

-- Theme
require("onedarkpro").setup({
	-- Theme can be overwritten with 'onedark' or 'onelight' as a string
	theme = "onedark",
	styles = {
		strings = "NONE", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "bold", -- Style that is applied to keywords
		functions = "bold", -- Style that is applied to functions
		variables = "italic,bold", -- Style that is applied to variables
		virtual_text = "NONE", -- Style that is applied to virtual text
	},
})
require("onedarkpro").load()
vim.cmd([[colorscheme onedarkpro]])

vim.g.poetv_auto_activate = "1"

require("Comment").setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})
