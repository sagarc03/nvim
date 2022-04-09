local hop = require("hop")
local opts = { noremap = true, silent = true }

hop.setup({ keys = "etovxqpdygfblzhckisuran" })

vim.api.nvim_set_keymap("n", "$", "<cmd>lua require'hop'.hint_words()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua require'hop'.hint_char1()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>", opts)

vim.api.nvim_set_keymap(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	opts
)
vim.api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	opts
)
