vim.g.NERDTreeIgnore = {".git", "node_modules", "__pycache__", ".pyc"}
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

vim.api.nvim_set_keymap("n", "<leader>nn", ":NERDTreeToggle<CR>", {silent = true, noremap = true})

