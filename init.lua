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
-- require("wilder")

require("nightfox").setup({
	options = {
		transparent = false, -- Disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening :terminal
		styles = {
			comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
			functions = "bold", -- Style that is applied to functions: see `highlight-args` for options
			keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
			strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
			variables = "italic,bold", -- Style that is applied to variables: see `highlight-args` for options
		},
		inverse = {
			match_paren = false, -- Enable/Disable inverse highlighting for match parens
			visual = false, -- Enable/Disable inverse highlighting for visual selection
			search = false, -- Enable/Disable inverse highlights for search highlights
		},
		colors = {}, -- Override default colors
		hlgroups = {}, -- Override highlight groups
	},
})
vim.cmd([[colorscheme nightfox]])

vim.g.poetv_auto_activate = "1"

require("Comment").setup()
require("gitsigns").setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})
