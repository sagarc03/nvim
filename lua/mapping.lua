local g = vim.g

local key_mapper = function(mode, key, result, opts)
	vim.api.nvim_set_keymap(mode, key, result, opts)
end

local opts = { noremap = true, silent = true }

-- Leader
g.mapleader = " "

key_mapper("i", "jk", "<ESC>", { silent = true })
key_mapper("i", "kj", "<ESC>", { silent = true })
key_mapper("i", "jj", "<ESC>", { silent = true })

-- Navigation
--
-- Normal Mode
key_mapper("n", "<C-h>", "<CMD>FocusSplitLeft %<CR>", opts)
key_mapper("n", "<C-j>", "<CMD>FocusSplitDown %<CR>", opts)
key_mapper("n", "<C-k>", "<CMD>FocusSplitUp %<CR>", opts)
key_mapper("n", "<C-l>", "<CMD>FocusSplitRight %<CR>", opts)

-- Insert Mode
key_mapper("i", "<C-h>", "<ESC><CMD>FocusSplitLeft<CR>", opts)
key_mapper("i", "<C-j>", "<ESC><CMD>FocusSplitDown<CR>", opts)
key_mapper("i", "<C-k>", "<ESC><CMD>FocusSplitUp<CR>", opts)
key_mapper("i", "<C-l>", "<ESC><CMD>FocusSplitRight<CR>", opts)

-- Other
key_mapper("n", "<leader>bn", ":bn<CR>", opts)
key_mapper("n", "<leader>bp", ":bp<CR>", opts)

key_mapper("n", "<C-z>", ":ToggleTerminal<CR>", opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)

-- Terminal Mode
local temp_opts = opts
temp_opts["expr"] = true
key_mapper("t", "<ESC>", [[(&filetype == "fzf" ? "ESC" : "<C-\><C-n>" )]], temp_opts)
vim.cmd([[tnoremap <c-h> <c-\><c-n><c-w>h]])
vim.cmd([[tnoremap <c-j> <c-\><c-n><c-w>j]])
vim.cmd([[tnoremap <c-k> <c-\><c-n><c-w>k]])
vim.cmd([[tnoremap <c-l> <c-\><c-n><c-w>l]])
