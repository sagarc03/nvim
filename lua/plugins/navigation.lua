return {
	{
		"beauwilliams/focus.nvim",
		lazy = true,
		event = "BufRead",
		--[[
		cmd = {
			"FocusSplitLeft",
			"FocusSplitDown",
			"FocusSplitUp",
			"FocusSplitRight",
		},
    --]]
		opts = {
			excluded_filetypes = { "toggleterm", "SidebarNvim", "DiffviewFiles", "NvimTree", "qf" },
			excluded_bufftypes = { "help", "nofile", "prompt", "quickfix" },
			signcolumn = false,
		},
		keys = {
			-- Normal Mode
			{ "<C-h>", "<CMD>FocusSplitLeft<CR>", desc = "Move focus or split left", mode = "n", noremap = true },
			{ "<C-j>", "<CMD>FocusSplitDown<CR>", desc = "Move focus or split down", mode = "n", noremap = true },
			{ "<C-k>", "<CMD>FocusSplitUp<CR>", desc = "Move focus or split up", mode = "n", noremap = true },
			{ "<C-l>", "<CMD>FocusSplitRight<CR>", desc = "Move focus or split up", mode = "n", noremap = true },
			-- Insert Mode
			{ "<C-h>", "<ESC><CMD>FocusSplitLeft<CR>", desc = "Move focus or split left", mode = "i", noremap = true },
			{ "<C-j>", "<ESC><CMD>FocusSplitDown<CR>", desc = "Move focus or split down", mode = "i", noremap = true },
			{ "<C-k>", "<ESC><CMD>FocusSplitUp<CR>", desc = "Move focus or split up", mode = "i", noremap = true },
			{ "<C-l>", "<ESC><CMD>FocusSplitRight<CR>", desc = "Move focus or split up", mode = "i", noremap = true },
		},
	},
	{
		"romgrk/barbar.nvim",
		event = "BufRead",
		keys = {
			{ "<leader>bp", "<CMD>BufferPrevious<CR>", desc = "Move to previous buffer", mode = "n", noremap = true },
			{ "<leader>bn", "<CMD>BufferNext<CR>", desc = "Move to next buffer", mode = "n", noremap = true },
		},
		opts = {},
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}
