return {
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, cmd = { "DiffViewOpen" } },
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signcolumn = false,
			numhl = true,
			linehl = false,
			word_diff = false,
		},
	},
}
