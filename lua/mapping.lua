local g = vim.g

local key_mapper = function(mode, key, result, opts)
    vim.api.nvim_set_keymap(mode, key, result, opts)
end

local opts = {noremap = true, silent = true}

-- Leader
g.mapleader = " "

key_mapper("i", "jk", "<ESC>", {silent = true})
key_mapper("i", "kj", "<ESC>", {silent = true})
key_mapper("i", "jj", "<ESC>", {silent = true})

-- Navigation
--
key_mapper("n", "<C-h>", ":FocusSplitLeft<CR>", opts)
key_mapper("n", "<C-j>", ":FocusSplitDown<CR>", opts)
key_mapper("n", "<C-k>", ":FocusSplitUp<CR>", opts)
key_mapper("n", "<C-l>", ":FocusSplitRight<CR>", opts)

-- Other
key_mapper("n", "<leader>bn", ":bn<CR>", opts)
key_mapper("n", "<leader>bp", ":bp<CR>", opts)

key_mapper("n", "<C-z>", ":ToggleTerminal<CR>", opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)
key_mapper("t", "<C-z>", [[<C-\><C-n>:ToggleTerminal<CR>]], opts)

local temp_opts = opts
temp_opts["expr"] = true
key_mapper("t", "<ESC>", [[(&filetype == "fzf" ? "ESC" : "<C-\><C-n>" )]], temp_opts)
