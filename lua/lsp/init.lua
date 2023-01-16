require("lsp.extra")
require("lsp.completion")
local lsp_status = require("lsp-status")
lsp_status.register_progress()

require("fidget").setup({})

require("mason").setup()
require("mason-lspconfig").setup()

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	client.server_capabilities.documentFormattingProvider = false -- 0.8 and later

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	lsp_status.on_attach(client)
end

require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- globals = { "vim" },
				globals = { "vim", "describe", "it", "before_each", "after_each", "teardown", "pending" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
	settings = {
		python = {
			formatting = { provider = "black" },
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

require("typescript").setup({
	server = { on_attach = on_attach },
})

-- setup nvim-go
require("go").setup({ linter = "golangci_lint", formatter = "gofmt" })

-- setup lsp client
require("lspconfig").gopls.setup({ on_attach = on_attach })
require("lspconfig").astro.setup({ on_attach = on_attach })

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = on_attach,
	},
})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		timeout_ms = 3000,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	debug = true,
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
		require("null-ls").builtins.formatting.prettier.with({
			extra_filetypes = { "astro" },
		}),
		require("null-ls").builtins.formatting.eslint.with({
			extra_filetypes = { "astro" },
		}),
		require("null-ls").builtins.formatting.djhtml.with({
			extra_args = { "-t", "2" },
		}),
		-- require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.formatting.rustfmt,

		-- Diagnostics
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.diagnostics.flake8,
		require("null-ls").builtins.diagnostics.mypy,
		require("null-ls").builtins.diagnostics.eslint.with({ extra_filetypes = { "astro" } }),
		-- require("null-ls").builtins.diagnostics.golangci_lint,

		-- Code Actions
		require("null-ls").builtins.code_actions.gitsigns,
		require("typescript.extensions.null-ls.code-actions"),
	},
})

vim.diagnostic.config({ virtual_text = false, float = { source = "always" } })
