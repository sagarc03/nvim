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
local lsp_installer_servers = require("nvim-lsp-installer.servers")

lsp_status.register_progress()

for _, server_name in pairs({ "sumneko_lua", "efm", "pyright", "gopls", "tsserver" }) do
	local ok, server = lsp_installer_servers.get_server(server_name)
	if ok then
		if not server:is_installed() then
			server:install()
		end
	end
end

require("navigator").setup({
	lsp_installer = true, -- set to true if you would like use the lsp installed by lspinstall
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
		format_on_save = false,
		efm = {
			on_attach = function(client, _)
				client.resolved_capabilities.document_formatting = true
			end,
			init_options = { documenFormatting = true, codeAction = true, document_formatting = true },
			root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", ".git", "pyproject.toml"),
			filetypes = vim.tbl_keys(languages),
			settings = { log_level = 1, log_file = "~/efm.log", languages = languages },
		},
	},
})
