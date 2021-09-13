require("lsp.formatting")
require("lsp.extra")
require("lspinstall").setup()
require("lsp-status").register_progress()
local lspconfig = require("lspconfig")
local languages = require("lsp.efm")
vim.g["coq_settings"] = { auto_start = "shut-up" }
require("coq")

require("navigator").setup({
	keymaps = {
		{ mode = "i", key = "<M-s>", func = "signature_help()" },
		{ key = "<c-s>", func = "signature_help()" },
		{ key = "<Space>cf", func = "formatting()", mode = "n" },
		{ key = "<Space>cf", func = "range_formatting()", mode = "v" },
	},
	lspinstall = true, -- set to true if you would like use the lsp installed by lspinstall
	lsp = {
		efm = {
			root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", ".git", "pyproject.toml"),
			filetypes = vim.tbl_keys(languages),
			init_options = { documentFormatting = true, codeAction = true },
			settings = { languages = languages, log_level = 1, log_file = "~/efm.log" },
		},
		lua = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "exepath" },
					},
				},
			},
		},
	},
})
