local key_mapper = function(mode, key, result, opts)
	vim.api.nvim_set_keymap(mode, key, result, opts)
end

local opts = { noremap = true, silent = true }

local someNumber = 123
print(someNumber)

key_mapper("i", "jk", "<ESC>", { silent = true })
key_mapper("i", "kj", "<ESC>", { silent = true })
key_mapper("i", "jj", "<ESC>", { silent = true })

-- Navigation
-- Prevents focus automatically resizing windows based on configured excluded filetypes or buftypes
-- Query filetypes using :lua print(vim.bo.ft) or buftypes using :lua print(vim.bo.buftype)
-- Default[filetypes]: none
-- Default[buftypes]: 'nofile', 'prompt', 'help'
require("focus").setup({
	excluded_filetypes = { "toggleterm", "SidebarNvim", "DiffviewFiles", "NvimTree", "qf" },
	excluded_bufftypes = { "help", "nofile", "prompt", "quickfix" },
	signcolumn = false,
})

-- Normal Mode
key_mapper("n", "<C-h>", "<CMD>FocusSplitLeft<CR>", opts)
key_mapper("n", "<C-j>", "<CMD>FocusSplitDown<CR>", opts)
key_mapper("n", "<C-k>", "<CMD>FocusSplitUp<CR>", opts)
key_mapper("n", "<C-l>", "<CMD>FocusSplitRight<CR>", opts)

-- Insert Mode
key_mapper("i", "<C-h>", "<ESC><CMD>FocusSplitLeft<CR>", opts)
key_mapper("i", "<C-j>", "<ESC><CMD>FocusSplitDown<CR>", opts)
key_mapper("i", "<C-k>", "<ESC><CMD>FocusSplitUp<CR>", opts)
key_mapper("i", "<C-l>", "<ESC><CMD>FocusSplitRight<CR>", opts)

-- Terminal Mode
local temp_opts = opts
temp_opts["expr"] = true
key_mapper("t", "<ESC>", [[(&filetype == "fzf" ? "ESC" : "<C-\><C-n>" )]], temp_opts)
vim.cmd([[tnoremap <c-h> <c-\><c-n><c-w>h]])
vim.cmd([[tnoremap <c-j> <c-\><c-n><c-w>j]])
vim.cmd([[tnoremap <c-k> <c-\><c-n><c-w>k]])
vim.cmd([[tnoremap <c-l> <c-\><c-n><c-w>l]])
