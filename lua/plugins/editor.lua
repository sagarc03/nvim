return { -- Common dependencies for all
	{ "sainnhe/edge", lazy = false, priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },
	{ "rose-pine/neovim", lazy = false, name = "rose-pine", priority = 1000 },
	{ "akinsho/horizon.nvim", lazy = false, version = "*", priority = 1000 },
	{ url = "https://gitlab.com/sxwpb/halfspace.nvim", lazy = false, priority = 1000 },
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{
		"Verf/deepwhite.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"mrjones2014/smart-splits.nvim",
		opts = {
			ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
			ignored_buftypes = { "nofile" },
			default_amount = 3,
			at_edge = "split",
		},
		lazy = false,
	},

	{
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
	},

	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function(_, opts)
			require("hop").setup(opts)
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		event = "BufRead",
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
		dependencies = "kevinhwang91/promise-async",
	},

	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{
		"ur4ltz/surround.nvim",
		event = "BufRead",
		opts = { mappings_style = "sandwich" },
	},

	{
		"windwp/nvim-autopairs",
		event = "BufRead",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},

	{ "lukas-reineke/indent-blankline.nvim", event = "BufRead" },

	{
		"akinsho/toggleterm.nvim",
		cmd = {
			"ToggleTerm",
			"TermExec",
		},
		opts = {
			-- size can be a number or function which is passed the current terminal
			-- based on the direction of the float set the height
			size = function(term)
				if term.direction == "horizontal" then
					return 10
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = false,
			start_in_insert = true,
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			insert_mappings = false, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float',
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell
		},
	},

	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
		cmd = {
			"RainbowDelim",
			"RainbowDelimSimple",
			"RainbowDelimQuoted",
			"RainbowMultiDelim",
		},
	},
}
