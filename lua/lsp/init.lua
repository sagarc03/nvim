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
require("lsp.completion")
require("lspinstall").setup()
require("lsp_signature").setup()
require("lsp-status").register_progress()
require("spellsitter").setup()
local lspconfig = require("lspconfig")
local languages = require("lsp.efm")

require("navigator").setup({
	keymaps = {
		{ mode = "i", key = "<M-s>", func = "signature_help()" },
		{ key = "<c-s>", func = "signature_help()" },
		{ key = "<Space>cf", func = "formatting()", mode = "n" },
		{ key = "<Space>cf", func = "range_formatting()", mode = "v" },
	},
	lspinstall = true, -- set to true if you would like use the lsp installed by lspinstall
	lsp = {
		format_on_save = false,
		efm = {
			root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", ".git", "pyproject.toml"),
			filetypes = vim.tbl_keys(languages),
			init_options = { documentFormatting = false, codeAction = false },
			settings = { languages = languages },
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
