local hop = require "hop"
local opts = {noremap = true, silent = true}

hop.setup({keys = "etovxqpdygfblzhckisuran"})

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap("n", "$", "<cmd>lua require'hop'.hint_words()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua require'hop'.hint_char1()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>", opts)
