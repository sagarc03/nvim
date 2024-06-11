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
			libgit2_path = "/usr/local/lib/libgit2.1.7.2.dylib",
			-- "/usr/local/Cellar/gpgme/1.23.2_1/lib/libgpgme.11.dylib"
			-- external_diff = true,
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
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
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
