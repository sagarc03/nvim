local on_attach = function(client, bufnr)
	-- client.server_capabilities.documentFormattingProvider = false
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end
return function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
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
					checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	require("lspconfig").pyright.setup({
		capabilities = capabilities,
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
		server = { capabilities = capabilities, on_attach = on_attach },
	})

	require("lspconfig").clangd.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").gopls.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").astro.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	require("lspconfig").yamlls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			yaml = {
				schemas = require("schemastore").yaml.schemas(),
				validate = { enable = true },
			},
		},
	})

	require("rust-tools").setup({
		server = {
			capabilities = capabilities,
			on_attach = on_attach,
		},
	})
	require("fidget").setup()
end
