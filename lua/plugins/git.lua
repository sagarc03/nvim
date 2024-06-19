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
		"SuperBo/fugit2.nvim",
		opts = {
			width = 70,
			libgit2_path = "/opt/homebrew/Cellar/libgit2/1.7.2/lib/libgit2.dylib",
			gpgme_path = "/opt/homebrew/Cellar/gpgme/1.23.2_1/lib/libgpgme.dylib",
			external_diffview = true,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>g", mode = "n", "<cmd>Fugit2<cr>" },
		},
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
