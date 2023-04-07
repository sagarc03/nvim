return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"simrat39/rust-tools.nvim",
			"b0o/schemastore.nvim",
			{ "folke/lsp-colors.nvim" },
			{
				"nvim-lua/lsp-status.nvim",
			},
			{
				"j-hui/fidget.nvim",
				config = function(_, opts)
					require("fidget").setup(opts)
				end,
			},
		},
		config = function()
			local lsp_status = require("lsp-status")
			lsp_status.register_progress()

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true }
				vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
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

				vim.diagnostic.config({ virtual_text = false, float = { source = "always" } })
			end

			require("lspconfig").lua_ls.setup({
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

			require("lspconfig").clangd.setup({ on_attach = on_attach })

			require("lspconfig").gopls.setup({ on_attach = on_attach })

			require("lspconfig").astro.setup({ on_attach = on_attach })

			require("lspconfig").tailwindcss.setup({ on_attach = on_attach })

			require("lspconfig").jsonls.setup({
				on_attach = on_attach,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			require("lspconfig").yamlls.setup({
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
					on_attach = on_attach,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					"honza/vim-snippets",
					"rafamadriz/friendly-snippets",
					"mlaursen/vim-react-snippets",
				},
				keys = {
					{ "<C-;>", "<CMD>lua require'luasnip'.jump(1)<CR>", mode = "i", noremap = true, silent = true },
					{
						"<C-'>",
						"<CMD>lua require'luasnip'.jump(-1)<CR>",
						mode = "i",
						noremap = true,
						silent = true,
					},
				},
				config = function(_, opts)
					local luasnip = require("luasnip")
					luasnip.setup(opts)
					luasnip.filetype_extend("all", { "_" })
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_snipmate").lazy_load()
				end,
			},
		},
		opts = function()
			local cmp = require("cmp")
			return {
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[Buffer ✏️]]",
							nvim_lsp = "[LSP ⚙️l]",
							luasnip = "[LuaSnip 🏭]",
							nvim_lua = "[NvimLua 🌍]",
							path = "[Path 📁]",
							emoji = "[Emoji 😄]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "emoji" },
				}),
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts)
			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"stylua",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			return {
				sources = {
					nls.builtins.formatting.stylua,

					nls.builtins.formatting.djhtml.with({
						extra_args = { "-t", "2" },
					}),
					-- nls.builtins.diagnostics.pylint,
					-- nls.builtins.diagnostics.flake8,
					-- nls.builtins.diagnostics.mypy,
					-- nls.builtins.formatting.black,
					-- nls.builtins.formatting.isort,
					nls.builtins.diagnostics.ruff,
					nls.builtins.formatting.prettier.with({ filetypes = { "astro" } }),
					nls.builtins.diagnostics.eslint.with({ filetypes = { "astro" } }),
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
		end,
	},
}
