return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"mrjones2014/nvim-ts-rainbow",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = require("plugins.conf.treesitter"),
		opts = {
			ensure_installed = "all",
			sync_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					node_decremental = "grm",
					scope_incremental = false,
				},
			},
			indent = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
						["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
	},
}
