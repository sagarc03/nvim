vim.g.mapleader = " "

require("general")
require("packages")
require("statusline")
require("lsp")
require("root")
require("telescopeconfig")
require("bufferlineconfig")
require("mapping")
require("file_explorer")
require("dashboard")
require("term")
require("scope")
require("git")

-- Theme
require("onenord").setup({
	borders = true, -- Split window borders
	italics = {
		comments = false, -- Italic comments
		strings = false, -- Italic strings
		keywords = true, -- Italic keywords
		functions = true, -- Italic functions
		variables = false, -- Italic variables
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	custom_highlights = {}, -- Overwrite default highlight groups
})
vim.cmd([[colorscheme onenord]])

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		-- additional_vim_regex_highlighting = false,
		additional_vim_regex_highlighting = { "org" },
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
})

--[[ local catppuccino = require("catppuccino")
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
		lsp_trouble = false,
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
}) ]]

require('Comment').setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sidebar-nvim").setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "right",
	initial_width = 15,
	update_interval = 1000,
	sections = { "datetime", "git-status", "lsp-diagnostics", "todos" },
	section_separator = "-----",
	containers = {
		attach_shell = "/bin/sh",
		show_all = true,
		interval = 5000,
	},
	datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
	todos = { ignored_paths = { "~" } },
})
vim.cmd([[call wilder#setup({'modes': [':', '/', '?']})]])
vim.cmd([[call wilder#set_option('renderer', wilder#wildmenu_renderer({'highlighter': wilder#basic_highlighter()}))]])
vim.cmd([[
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
]])
-- vim.cmd([[call wilder#set_option('renderer', wilder#popupmenu_renderer({'highlighter': wilder#basic_highlighter()}))]])
