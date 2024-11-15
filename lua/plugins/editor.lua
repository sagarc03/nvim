return { -- Common dependencies for all
	-- { "sainnhe/edge", lazy = false, priority = 1000 },
	-- { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	-- { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },
	-- { "rose-pine/neovim", lazy = false, name = "rose-pine", priority = 1000 },
	-- { "akinsho/horizon.nvim", lazy = false, version = "*", priority = 1000 },
	-- { url = "https://gitlab.com/sxwpb/halfspace.nvim", lazy = false, priority = 1000 },
	-- { "miikanissi/modus-themes.nvim", priority = 1000 },
	-- {
	-- 	"Verf/deepwhite.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
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
		lazy = true,
		keys = {
			-- Move direction
			{
				"<C-h>",
				function()
					require("smart-splits").move_cursor_left()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<C-j>",
				function()
					require("smart-splits").move_cursor_down()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<C-k>",
				function()
					require("smart-splits").move_cursor_up()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<C-l>",
				function()
					require("smart-splits").move_cursor_right()
				end,
				mode = { "n", "i", "v" },
			},
			-- Resize buffer
			{
				"<A-h>",
				function()
					require("smart-splits").resize_left()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<A-j>",
				function()
					require("smart-splits").resize_down()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<A-k>",
				function()
					require("smart-splits").resize_up()
				end,
				mode = { "n", "i", "v" },
			},
			{
				"<A-l>",
				function()
					require("smart-splits").resize_right()
				end,
				mode = { "n", "i", "v" },
			},
		},
	},

	{
		"famiu/bufdelete.nvim",
		lazy = true,
		keys = {
			{ "bd", [[<CMD>Bdelete "%"<CR>]] },
		},
	},

	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function(_, opts)
			require("hop").setup(opts)
		end,
		keys = {
			{
				"$",
				function()
					require("hop").hint_words()
				end,
			},
			{
				"<leader>/",
				function()
					require("hop").hint_patterns()
				end,
			},
			{
				"f",
				function()
					local hint = require("hop.hint")
					require("hop").hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
				end,
			},
			{
				"F",
				function()
					local hint = require("hop.hint")
					require("hop").hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
				end,
			},
			{
				"t",
				function()
					local hint = require("hop.hint")
					require("hop").hint_char1({
						direction = hint.HintDirection.AFTER_CURSOR,
						current_line_only = true,
						hint_offset = -1,
					})
				end,
			},
			{
				"T",
				function()
					local hint = require("hop.hint")
					require("hop").hint_char1({
						direction = hint.HintDirection.BEFORE_CURSOR,
						current_line_only = true,
						hint_offset = 1,
					})
				end,
			},
		},
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
		"kylechui/nvim-surround",
		lazy = true,
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
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
			open_mapping = false,
			start_in_insert = true,
			hide_numbers = true, -- hide the number column in toggleterm buffers
			insert_mappings = false, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell
		},
		keys = {
			{ "<ESC>", "[[<C-><C-n>]]", mode = "t" },
			{ "<C-,>", [[<CMD>execute v:count . "ToggleTerm"<CR>]], mode = { "n", "i", "t" } },
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

	{
		"karb94/neoscroll.nvim",
		lazy = true,
		config = function()
			require("neoscroll").setup({})
		end,
	},
}
