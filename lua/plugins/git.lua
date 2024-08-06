return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		opts = {
			signcolumn = false,
			numhl = true,
			linehl = false,
			word_diff = false,
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	cmd = { "Neogit" },
	keys = {
		{ "<leader>g", mode = "n", "<cmd>Neogit<cr>" },
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- lazy, only load diffview by these commands
		cmd = {
			"DiffviewFileHistory",
			"DiffviewOpen",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
	},
}
