-- Common mapping options
local mapping_options = { silent = true, noremap = true }

vim.keymap.set("n", "<space>el", vim.diagnostic.open_float, mapping_options)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, mapping_options)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, mapping_options)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, mapping_options)

-- vim.keymap.set("n", "<leader>b|", vim.cmd.vsplit, mapping_options)
-- vim.keymap.set("n", "<leader>b-", vim.cmd.split, mapping_options)
