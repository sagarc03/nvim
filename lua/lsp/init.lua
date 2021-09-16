--                    ___           ___                              ___
--                   /\__\         /\  \                            /\  \
--                  /:/ _/_       /::\  \              ___          \:\  \       ___           ___
--                 /:/ /\  \     /:/\:\__\            /\__\          \:\  \     /\__\         /\__\
--  ___     ___   /:/ /::\  \   /:/ /:/  /           /:/__/      _____\:\  \   /:/__/        /:/  /
-- /\  \   /\__\ /:/_/:/\:\__\ /:/_/:/  /           /::\  \     /::::::::\__\ /::\  \       /:/__/
-- \:\  \ /:/  / \:\/:/ /:/  / \:\/:/  /            \/\:\  \__  \:\~~\~~\/__/ \/\:\  \__   /::\  \
--  \:\  /:/  /   \::/ /:/  /   \::/__/              ~~\:\/\__\  \:\  \        ~~\:\/\__\ /:/\:\  \
--   \:\/:/  /     \/_/:/  /     \:\  \                 \::/  /   \:\  \          \::/  / \/__\:\  \
--    \::/  /        /:/  /       \:\__\                /:/  /     \:\__\         /:/  /       \:\__\
--     \/__/         \/__/         \/__/                \/__/       \/__/         \/__/         \/__/
--
--
--
require("lsp.formatting")
require("lsp.extra")
require("lspinstall").setup()
require("lsp-status").register_progress()
local lspconfig = require("lspconfig")
local languages = require("lsp.efm")
vim.g["coq_settings"] = { auto_start = "shut-up" }
require("coq")
require("coq_3p")({
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "figlet", short_name = "BIG" },
})

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
