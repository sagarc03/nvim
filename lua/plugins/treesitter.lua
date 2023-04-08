return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
		dependencies = { "mrjones2014/nvim-ts-rainbow" },
		config = require("plugins.conf.treesitter"),
		opts = {
			ensure_installed = "all",
			ignore_install = {},
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
	},
}
