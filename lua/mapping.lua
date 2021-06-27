require("keybinding")
local g = vim.g

local key_mapper = function(mode, key, result, opts)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result, 
		opts
		)
end

local opts = {noremap = true, silent = true}

function WinMove(key)
	local curwind = vim.api.nvim_win_get_number(vim.api.nvim_get_current_win())
	vim.cmd("wincmd " .. key)
	if curwind == vim.api.nvim_win_get_number(vim.api.nvim_get_current_win()) then
		if key == "j" or key == "k" then
			vim.cmd("wincmd s")
		else
			vim.cmd("wincmd v")
		end
		vim.cmd("wincmd " .. key)
	end

end

-- Leader
g.mapleader = " "

-- Navigation
key_mapper("n", "<C-h>", ":lua WinMove('h')<CR>", opts)
key_mapper("n", "<C-j>", ":lua WinMove('j')<CR>", opts)
key_mapper("n", "<C-k>", ":lua WinMove('k')<CR>", opts)
key_mapper("n", "<C-l>", ":lua WinMove('l')<CR>", opts)

-- Other
key_mapper("n", "<leader>o", "o<ESC>", opts)
key_mapper("n", "<leader>O", "O<ESC>", opts)
key_mapper("n", "<leader>,", ":noh<CR>", opts)
key_mapper("n", "<leader>bn", ":bn<CR>", opts)
key_mapper("n", "<leader>bp", ":bp<CR>", opts)
key_mapper("n", "<leader>ls", ":!ls<CR>", opts)

key_mapper("n", "<C-z>", ":ToggleTerminal<CR>",opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)
local temp_opts = opts
temp_opts["expr"] = true
key_mapper("t","<ESC>", [[(&filetype == "fzf" ? "ESC" : "<C-\><C-n>" )]],temp_opts)
