require("lsp.formatting")
require("lsp.extra")
require("lsp.completion")
require("lsp_signature").setup()

local lsp_status = require("lsp-status")

lsp_status.register_progress()

require("navigator").setup({
	keymaps = {
		{ key = "gs", func = vim.lsp.buf.signature_help, doc = "signature_help" },
		{ key = ",ff", func = vim.lsp.buf.format, mode = "n", doc = "format" },
		{ key = ",ff", func = vim.lsp.buf.range_formatting, mode = "v", doc = "range format" },
	},
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

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		-- filter = function(clients)
		--     -- filter out clients that you don't want to use
		--     return vim.tbl_filter(function(client)
		--         return client.name ~= "tsserver"
		--     end, clients)
		-- end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
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
