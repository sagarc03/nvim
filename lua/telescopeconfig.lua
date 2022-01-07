local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fd", ":Telescope dash search<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fim", ":Telescope goimpl<CR>", opts)

require("telescope").load_extension("fzf")
require("telescope").load_extension("projects")
require("telescope").load_extension("emoji")
require("telescope").load_extension("goimpl")

require("telescope").setup({
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
})
