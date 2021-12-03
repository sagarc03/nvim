vim.g.mapleader = " "
require("general")
require("treesitter")
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
require("wilder")

-- Theme
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = true
vim.g.moonlight_disable_background = false
require("moonlight").set()

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"

require("Comment").setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sidebar-nvim").setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "right",
	initial_width = 20,
	update_interval = 1000,
	sections = { "git-status", "lsp-diagnostics", "todos" },
	section_separator = "-----",
	containers = {
		attach_shell = "/bin/sh",
		show_all = true,
		interval = 5000,
	},
	todos = { ignored_paths = { "~" } },
})
