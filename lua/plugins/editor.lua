return {
	{
		"ThePrimeagen/refactoring.nvim",
		event = "BufRead",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		keys = {
			{
				"<leader>re",
				[[<ESC><CMD>lua require("refactoring").refactor("Extract Function")<CR>]],
				desc = "Extract last highlited block to a function",
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
			{
				"<leader>rf",
				[[<ESC><CMD>lua require("refactoring").refactor("Extract Function To File")<CR>]],
				desc = "Extract last highlited block to a function in a new file",
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
			{
				"<leader>rv",
				[[<ESC><CMD>lua require("refactoring").refactor("Extract Variable")<CR>]],
				desc = "Extract last highlited expression to it's own variable and replace occurence",
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
			{
				"<leader>ri",
				[[<ESC><CMD>lua require("refactoring").refactor("Inline Variable")<CR>]],
				desc = "Extract last highlited variable with the expression",
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
			{
				"<leader>ri",
				[[<CMD>lua require("refactoring").refactor("Inline Variable")<CR>]],
				desc = "Extract last highlited variable with the expression",
				mode = "n",
				noremap = true,
				silent = true,
				expr = false,
			},

			{
				"<leader>rb",
				[[<CMD>lua require("refactoring").refactor("Extract Block")<CR>]],
				desc = "Extract last highlited block to a function",
				mode = "n",
				noremap = true,
				silent = true,
				expr = false,
			},
			{
				"<leader>rbf",
				[[<CMD>lua require("refactoring").refactor("Extract Block To File")<CR>]],
				desc = "Extract last highlited block to a function in a new file",
				mode = "n",
				noremap = true,
				silent = true,
				expr = false,
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
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
	{
		"phaazon/hop.nvim",
		keys = {
			{ "$", "<CMD>lua require'hop'.hint_words()<CR>", mode = "n", noremap = true, silent = true },
			{ "<leader>s", "<CMD>lua require'hop'.hint_char1()<CR>", mode = "n", noremap = true, silent = true },
			{ "<leader>/", "<CMD>lua require'hop'.hint_patterns()<CR>", mode = "n", noremap = true, silent = true },
			{ "<leader>l", "<CMD>lua require'hop'.hint_lines()<CR>", mode = "n", noremap = true, silent = true },
			{
				"f",
				"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"F",
				"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"f",
				"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
				mode = "o",
				noremap = true,
				silent = true,
			},
			{
				"F",
				"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
				mode = "o",
				noremap = true,
				silent = true,
			},
		},
		event = "BufRead",
		opts = { keys = "etovxqpdygfblzhckisuran" },
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
}
