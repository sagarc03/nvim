require("lsp.formatting")
require("lsp.extra")
require("lsp.completion")
require("lsp_signature").setup()

local lsp_status = require("lsp-status")
local lspconfig = require("lspconfig")

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
		disable_format_cap = { "pyright", "sumneko_lua", "tsserver", "yamlls", "volar" },
		disable_lsp = { "flow", "vuels" },
		volar = {
			cmd = { "volar-server", "--stdio" },
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			root_dir = lspconfig.util.root_pattern(".git", "yarn.lock", "package.json", "vite.config.ts"),
		},
	},
})

require("null-ls").setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
		end
	end,
	sources = {
		-- Formating
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.isort,
		require("null-ls").builtins.formatting.prettier,

		-- Diagnostics
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.diagnostics.mypy,
		require("null-ls").builtins.diagnostics.eslint,

		-- Code Actions
		require("null-ls").builtins.code_actions.gitsigns,
		require("null-ls").builtins.code_actions.refactoring,

		-- Completion
		require("null-ls").builtins.completion.spell,
	},
})
