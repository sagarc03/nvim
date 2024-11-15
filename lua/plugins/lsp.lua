return {

	{
		"danymat/neogen",
		config = function(_, opts)
			require("neogen").setup(opts)
		end,
		opts = {
			snippet_engine = "luasnip",
			languages = {
				python = {
					template = {
						annotation_convention = "reST", -- for a full list of annotation_conventions, see supported-languages below,
					},
				},
			},
		},
		cmd = { "Neogen" },
		keys = {
			{ "ga", "<CMD>Neogen<CR>" },
		},
	},

	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- 	opts = {
	-- 		prompt_func_return_type = {
	-- 			go = true,
	-- 			java = true,
	-- 			cpp = true,
	-- 			c = true,
	-- 			h = true,
	-- 			hpp = true,
	-- 			cxx = true,
	-- 		},
	-- 		prompt_func_param_type = {
	-- 			go = true,
	-- 			java = true,
	--
	-- 			cpp = true,
	-- 			c = true,
	-- 			h = true,
	-- 			hpp = true,
	-- 			cxx = true,
	-- 		},
	-- 		printf_statements = {},
	-- 		print_var_statements = {},
	-- 	},
	-- },
	--
	-- {
	-- 	"ray-x/go.nvim",
	-- 	dependencies = { -- optional packages
	-- 		"ray-x/guihua.lua",
	-- 		"neovim/nvim-lspconfig",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		local capabilities =
	-- 			require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- 		require("go").setup({
	-- 			lsp_cfg = {
	-- 				capabilities = capabilities,
	-- 			},
	-- 		})
	-- 	end,
	-- 	event = { "CmdlineEnter" },
	-- 	ft = { "go", "gomod" },
	-- 	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	-- },

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		-- branch = "develop", -- if you want develop branch
		-- keep in mind, it might break everything
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
		},
		-- (optional) will update plugin's deps on every update
		build = function()
			vim.cmd.GoInstallDeps()
		end,
		-- @type gopher.Config
		opts = {},
	},

	{
		"folke/neodev.nvim",
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"b0o/SchemaStore.nvim",
			"simrat39/rust-tools.nvim",
			{ "j-hui/fidget.nvim", branch = "legacy" },
			"pmizio/typescript-tools.nvim",
		},
		config = require("plugins.conf.lsp"),
		lazy = true,
		event = "BufRead",
	},

	{
		"stevearc/conform.nvim",
		opts = {
			-- Map of filetype to formatters
			formatters_by_ft = {
				cpp = { "clang_format" },
				c = { "clang_format" },
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				python = { "ruff_organize_imports", "ruff_format" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				sql = { "pg_format" },
				astro = { "prettier" },
				go = { "goimports", "golines", "gofmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				hcl = { "terraform_fmt" },
				yaml = { "yamlfmt" },
				-- Use the "*" filetype to run formatters on all filetypes.
				["*"] = {},
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 1000,
			},
			formatters = {
				-- p_format = {
				-- 	inherit = true,
				-- 	prepend_args = { "--keyword-case", "2", "--type-case", "2" },
				-- },
			},
		},
		lazy = true,
		event = "BufRead",
	},

	{
		"folke/trouble.nvim",
		keys = {
			{
				"gs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"ge",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "Diagnostic (Trouble)",
			},
		},
		opts = {}, -- for default options, refer to the configuration section for custom setup.
	},

	{
		"stevearc/overseer.nvim",
		opts = {
			-- strategy = "toggleterm",
			task_list = {
				-- Default detail level for tasks. Can be 1-3.
				direction = "bottom",
			},
		},
		keys = {
			{ "<leader>r", mode = "n", "<cmd>OverseerRun<cr>" },
			{ "<leader>o", mode = "n", "<cmd>OverseerToggle<cr>" },
		},
		dependencies = { "stevearc/dressing.nvim" },
		lazy = true,
	},

	{ "mfussenegger/nvim-lint", config = require("plugins.conf.lint"), lazy = true },

	{ "nanotee/sqls.nvim", ft = { "sql" } },

	{
		"jinzhongjia/LspUI.nvim",
		branch = "main",
		config = function()
			require("LspUI").setup()
		end,
		cmd = { "LspUI" },
		keys = {
			{
				"<leader>rn",
				"<cmd>LspUI rename<CR><cmd>wa!<CR>",
				desc = "LSP Rename",
			},
		},
	},

	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					-- require('hover.providers.gh')
					-- require('hover.providers.gh_user')
					-- require('hover.providers.jira')
					-- require('hover.providers.dap')
					-- require('hover.providers.fold_preview')
					-- require('hover.providers.diagnostic')
					-- require('hover.providers.man')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = "single",
				},
				-- Whether the contents of a currently open hover window should be moved
				-- to a :h preview-window when pressing the hover keymap.
				preview_window = false,
				title = true,
				mouse_providers = {
					"LSP",
				},
				mouse_delay = 1000,
			})
		end,
		keys = {
			{
				"K",
				function()
					require("hover").hover()
				end,
			},
		},
	},
}
