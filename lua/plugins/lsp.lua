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
	},

	{
		"ThePrimeagen/refactoring.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		opts = {
			prompt_func_return_type = {
				go = true,
				java = true,
				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = true,
			},
			prompt_func_param_type = {
				go = true,
				java = true,

				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = true,
			},
			printf_statements = {},
			print_var_statements = {},
		},
	},

	-- {
	-- 	"ray-x/go.nvim",
	-- 	dependencies = { -- optional packages
	-- 		"ray-x/guihua.lua",
	-- 	},
	-- 	config = require("plugins.conf.go"),
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	ft = { "go", "gomod" },
	-- 	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	-- },
	-- {
	--   "fatih/vim-go",
	--   --	ft = { "go", "gomod" },
	--   build = "GoInstallBinaries",
	-- },
	{
		"olexsmir/gopher.nvim",
		ft = { "go", "gomod", "gowork" },
		build = "GoInstallDeps",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
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
			"jose-elias-alvarez/typescript.nvim",
			"simrat39/rust-tools.nvim",
			{ "j-hui/fidget.nvim", branch = "legacy" },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins.conf.lsp"),
	},

	-- {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   event = { "BufReadPre", "BufNewFile" },
	--   config = require("plugins.conf.null_ls"),
	-- },

	-- {
	--   "nvimdev/guard.nvim",
	--   event = { "BufReadPre", "BufNewFile" },
	--   config = require("plugins.conf.guard"),
	--   dependencies = {
	--     "nvimdev/guard-collection",
	--   },
	-- },

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
		"lewis6991/hover.nvim",
		config = require("plugins.conf.hover"),
	},

	{
		"google/executor.nvim",
		cmd = { "ExecutorRun" },
		opts = {
			use_split = true,
			split = {
				position = "right",
				size = math.floor(vim.o.columns * 1 / 4),
			},
			popup = {
				width = math.floor(vim.o.columns * 3 / 5),
				height = vim.o.lines - 20,
			},
			output_filter = function(_, lines)
				return lines
			end,
			notifications = {
				task_started = true,
				task_completed = true,
			},
		},
	},
	{
		"stevearc/overseer.nvim",
		lazy = true,
		cmd = { "OverseerToggle", "OverseerInfo", "OverseerRun", "OverseerBuild" },
		opts = {
			-- strategy = "toggleterm",
		},
	},
	{ "mfussenegger/nvim-lint", config = require("plugins.conf.lint") },
	{ "nanotee/sqls.nvim", ft = { "sql" } },
	{
		"jinzhongjia/LspUI.nvim",
		branch = "main",
		event = "VeryLazy",
		config = function()
			require("LspUI").setup()
		end,
		keys = {
			{
				"K",
				"<cmd>LspUI hover<CR>",
				desc = "LSP Hover",
			},
			{
				"<leader>rn",
				"<cmd>LspUI rename<CR>",
				desc = "LSP Rename",
			},
		},
	},
}
