return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
		},
		opts = {
			ensure_installed = "all",
			ignore_install = {},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			textobjects = {
				select = { enable = true },
				move = { enable = true },
				swap = { enable = true },
				lsp_interlop = { enable = true },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- { "nvim-treesitter/nvim-treesitter-context" },
	{

		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		lazy=true,
	},
}
