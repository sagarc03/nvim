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
require("lsp_signature").setup()

local lsp_status = require("lsp-status")
local lspconfig = require("lspconfig")

local languages = require("lsp.efm")

lsp_status.register_progress()

require("navigator").setup({
	keymaps = { { key = "gs", func = "signature_help()" } },
	lsp_installer = false, -- set to true if you would like use the lsp installed by lspinstall
	on_attach = function(client, bufnr)
		lsp_status.on_attach(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[augroup Format]])
			vim.cmd([[autocmd! * <buffer>]])
			vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
			vim.cmd([[augroup END]])
		end
	end,
	lsp = {
		servers = { "volar" },
		format_on_save = false,
		disable_format_cap = { "pyright", "sumneko_lua", "tsserver", "volar"},
		disable_lsp = { "flow", "vuels" },
		efm = {
			on_attach = function(client, _)
				client.resolved_capabilities.document_formatting = true
			end,
			init_options = { documenFormatting = true, codeAction = true, document_formatting = true },
			root_dir = lspconfig.util.root_pattern(".git", "yarn.lock", "package.json", "pyproject.toml"),
			filetypes = vim.tbl_keys(languages),
			settings = { log_level = 1, log_file = "~/efm.log", languages = languages },
		},
		volar = {
			cmd = { "volar-server", "--stdio" },
			filetypes = { "vue" },
			root_dir = lspconfig.util.root_pattern(".git", "yarn.lock", "package.json"),
		},
	},
})
