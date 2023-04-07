return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = true,
		cmd = {
			"ToggleTerm",
			"TermExec",
		},
		keys = {
			{ "<ESC>", [[<C-\><C-n>]], mode = "t", desc = "Escape in terminal", silent = true, noremap = true },
			{
				"<C-,>",
				'<CMD>execute v:count . "ToggleTerm"<CR>',
				mode = "n",
				desc = "Toggle Terminal",
				silent = true,
				noremap = true,
			},
			{
				"<C-,>",
				"<ESC><CMD>ToggleTerm<CR>",
				mode = "i",
				desc = "Toggle Terminal in insert mode",
				silent = true,
				noremap = true,
			},
			{
				"<C-,>",
				[[<C-\><C-n><CMD>ToggleTerm<CR>]],
				mode = "t",
				desc = "Toggle Terminal in terminal mode",
				silent = true,
				noremap = true,
			},
			{
				"<C-h>",
				[[<C-\><C-n><CMD>wincmd h<CR>]],
				mode = "t",
				desc = "navigate left in terminal mode",
				silent = true,
				noremap = true,
			},
			{
				"<C-j>",
				[[<C-\><C-n><CMD>wincmd j<CR>]],
				mode = "t",
				desc = "navigate down  in terminal mode",
				silent = true,
				noremap = true,
			},
			{
				"<C-k>",
				[[<C-\><C-n><CMD>wincmd k<CR>]],
				mode = "t",
				desc = "navigate up in terminal mode",
				silent = true,
				noremap = true,
			},
			{
				"<C-l>",
				[[<C-\><C-n><CMD>wincmd l<CR>]],
				mode = "t",
				desc = "navigate right in terminal mode",
				silent = true,
				noremap = true,
			},
		},
		opts = {--[[ things you want to change go here]]
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
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal return term.name
					return term.id
				end,
			},
		},
	},
}
