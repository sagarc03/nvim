vim.g.mapleader = " "

require("packages")
require("general")
require("treesitter")
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
require("mini.surround").setup({
	-- Add custom surroundings to be used on top of builtin ones. For more
	-- information with examples, see `:h MiniSurround.config`.
	custom_surroundings = nil,

	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "sa", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`
	},

	-- Number of lines within which surrounding is searched
	n_lines = 50,

	-- How to search for surrounding (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest'. For more details, see `:h MiniSurround.config`.
	search_method = "cover",
})
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})
