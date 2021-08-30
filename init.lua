require("packages")
require("lsp")
require("mapping")
require("general")
require("ctree")
require("telescopeconfig")
require("statusline")
require("dashboard")
require("term")
require("scope")
require("root")
require("bufferlineconfig")

vim.cmd([[colorscheme catppuccino]])
-- vim.cmd([[set background=dark]])

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

local catppuccino = require("catppuccino")
catppuccino.setup({
	colorscheme = "dark_catppuccino",
	transparency = false,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "bold",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			styles = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
		},
		lsp_saga = true,
		gitsigns = true,
		telescope = true,
		which_key = true,
		indent_blankline = false,
		dashboard = true,
		vim_sneak = false,
		bufferline = true,
		markdown = true,
	},
})
