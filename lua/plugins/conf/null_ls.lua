return function(_, opts)
	local nls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local default_opts = {
		sources = {
			nls.builtins.formatting.stylua,

			nls.builtins.formatting.djhtml.with({
				extra_args = { "-t", "2" },
			}),
			-- nls.builtins.diagnostics.pylint,
			-- nls.builtins.diagnostics.flake8,
			nls.builtins.diagnostics.mypy,
			nls.builtins.formatting.black,
			nls.builtins.formatting.isort,
			nls.builtins.diagnostics.ruff,
			nls.builtins.formatting.prettier.with({ filetypes = { "astro" } }),
			nls.builtins.diagnostics.eslint.with({ filetypes = { "astro" } }),
			nls.builtins.code_actions.gitsigns,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	}
	local final_opts = vim.tbl_extend("force", default_opts, opts)
	nls.setup(final_opts)
end
