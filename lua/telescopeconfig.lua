local opts = {noremap = true}
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

