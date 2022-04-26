require("lsp.formatting")
require("lsp.extra")
require("lsp.completion")
require("lsp_signature").setup()

local lsp_status = require("lsp-status")

lsp_status.register_progress()

require("navigator").setup({
	keymaps = { { key = "gs", func = "signature_help()" } },
	lsp_installer = false, -- set to true if you would like use the lsp installed by lspinstall
	debug = true,
	lsp = {
		format_on_save = false,
		disable_format_cap = { "pyright", "sumneko_lua", "tsserver", "yamlls", "html" },
		disable_lsp = {
			"angularls",
			"gopls",
			"flow",
			"bashls",
			"dockerls",
			"julials",
			"pylsp",
			"jedi_language_server",
			"jdtls",
			"vimls",
			"jsonls",
			"solargraph",
			"cssls",
			"clangd",
			"ccls",
			"sqls",
			"denols",
			"graphql",
			"dartls",
			"dotls",
			"kotlin_language_server",
			"nimls",
			"intelephense",
			"vuels",
			"phpactor",
			"omnisharp",
			"r_language_server",
			"rust_analyzer",
			"terraformls",
			"svelte",
			"texlab",
			"clojure_lsp",
			"elixirls",
			"sourcekit",
			"fsautocomplete",
			"vls",
			"hls",
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
		require("null-ls").builtins.formatting.djhtml.with({
			extra_args = { "-t", "2" },
		}),

		-- Diagnostics
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.diagnostics.flake8.with({ command = "pflake8" }),
		require("null-ls").builtins.diagnostics.mypy,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.diagnostics.stylelint,

		-- Code Actions
		require("null-ls").builtins.code_actions.gitsigns,
		require("null-ls").builtins.code_actions.refactoring,
	},
})
