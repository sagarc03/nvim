vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

vim.g.EasyMotion_do_mapping = 0 

-- Jump to anywhere you want with minimal keystrokes, with just one key binding.
-- `s{char}{label}`
-- nmap s <Plug>(easymotion-overwin-f)
vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f)", {})


-- Turn on case-insensitive feature
vim.g.EasyMotion_smartcase = 1

-- JK motions: Line motions
-- map <Leader>j <Plug>(easymotion-j)
-- map <Leader>k <Plug>(easymotion-k)
vim.api.nvim_set_keymap("n", "<leader>j", "<Plug>(easymotion-j)", {})
vim.api.nvim_set_keymap("n", "<leader>k", "<Plug>(easymotion-k)", {})
