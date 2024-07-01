local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", "<CMD>LspUI hover<CR>", bufopts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<space>rn", "<CMD>LspUI rename<CR>", bufopts)
	-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
end

return function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("neodev").setup()
	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- runtime = {
				-- 	-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				-- 	version = "LuaJIT",
				-- },
				-- diagnostics = {
				-- 	-- Get the language server to recognize the `vim` global
				-- 	-- globals = { "vim" },
				-- 	globals = { "vim", "describe", "it", "before_each", "after_each", "teardown", "pending" },
				-- },
				-- workspace = {
				-- 	-- Make the server aware of Neovim runtime files
				-- 	library = vim.api.nvim_get_runtime_file("", true),
				-- 	checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
				-- },
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	require("lspconfig").ruff.setup({
		on_attach = on_attach,
	})

	require("lspconfig").pyright.setup({
		capabilities = capabilities,
		settings = {
			pyright = {
				-- Using Ruff's import organizer
				disableOrganizeImports = true,
			},
			python = {
				analysis = {
					-- Ignore all files for analysis to exclusively use Ruff for linting
					ignore = { "*" },
				},
			},
		},
	})

	-- require("lspconfig").pylsp.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	pylsp = {
	-- 		plugins = {
	-- 			ruff = {
	-- 				enabled = true,
	-- 			},
	-- 		},
	-- 	},
	-- })

	-- require("lspconfig").ruff_lsp.setup({
	-- 	server = {
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 	},
	-- })

	require("typescript").setup({
		server = {
			capabilities = capabilities,
			on_attach = on_attach,
		},
	})

	-- require("lspconfig").eslint.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = function(client, bufnr)
	-- 		on_attach(client, bufnr)
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			buffer = bufnr,
	-- 			command = "EslintFixAll",
	-- 		})
	-- 	end,
	-- })
	require("lspconfig").svelte.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").clangd.setup({
		cmd = { "/usr/bin/clangd" },
		capabilities = capabilities,
		on_attach = on_attach,
	})
	require("lspconfig").cmake.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").gopls.setup({ capabilities = capabilities, on_attach = on_attach })

	require("lspconfig").astro.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		typescript = "/opt/homebrew/bin/tsserver",
	})

	require("lspconfig").tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })
	require("lspconfig").emmet_ls.setup({ capabilities = capabilities, on_attach = on_attach })
	require("lspconfig").taplo.setup({ capabilities = capabilities, on_attach = on_attach })
	require("lspconfig").sqls.setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			require("sqls").on_attach(client, bufnr)
			on_attach(client, bufnr)
		end,
		root_dir = require("lspconfig.util").root_pattern(".git"),
	})

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
	require("lspconfig").terraformls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "terraform", "terraform-vars", "tf", "hcl" },
	})
	require("lspconfig").dockerls.setup({ capabilities = capabilities, on_attach = on_attach })

	require("rust-tools").setup({
		server = {
			capabilities = capabilities,
			on_attach = on_attach,
		},
	})

	require("lspconfig").typos_lsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	require("fidget").setup()
end
