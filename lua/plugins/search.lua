return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "search for files", mode = "n", noremap = true },
			{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "search open buffers", mode = "n", noremap = true },
			{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "search/grep files", mode = "n", noremap = true },
			{ "<leader>fp", "<CMD>Telescope projects<CR>", desc = "search projects", mode = "n", noremap = true },
			{ "<leader>fn", "<CMD>Telescope notify<CR>", desc = "search projects", mode = "n", noremap = true },
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("projects")
			require("telescope").load_extension("emoji")
			require("telescope").load_extension("notify")
		end,
		opts = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_ignore_patterns = { "node_modules" },
				path_display = { "absolute" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = false, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
				},
			},
		},
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"xiyaowong/telescope-emoji.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
}
