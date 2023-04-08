-- Get the loaded plugins
local loaded_plugins = {}
for _, v in pairs(require("lazy").plugins()) do
	loaded_plugins[v["name"]] = true
end

-- Common mapping options
local mapping_options = { silent = true, noremap = true }

if loaded_plugins["neo-tree.nvim"] then
	vim.keymap.set("n", "<leader>nn", "<CMD>NeoTreeShowToggle<CR>", mapping_options)
end

if loaded_plugins["toggleterm.nvim"] then
	vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], mapping_options)
	vim.keymap.set({ "n", "i", "t" }, "<C-,>", '<CMD>execute v:count . "ToggleTerm"<CR>', mapping_options)
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><CMD>wincmd h<CR>]], mapping_options)
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><CMD>wincmd j<CR>]], mapping_options)
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><CMD>wincmd k<CR>]], mapping_options)
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><CMD>wincmd l<CR>]], mapping_options)
end

if loaded_plugins["hop.nvim"] then
	local hop = require("hop")
	local hint = require("hop.hint")
	vim.keymap.set("n", "$", hop.hint_words, mapping_options)
	vim.keymap.set("n", "<leader>s", hop.hint_char1, mapping_options)
	vim.keymap.set("n", "<leader>/", hop.hint_patterns, mapping_options)
	vim.keymap.set("n", "<leader>l", hop.hint_lines, mapping_options)
	vim.keymap.set("n", "f", function()
		hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("n", "F", function()
		hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("o", "f", function()
		hop.hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("o", "F", function()
		hop.hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
	end, mapping_options)
end

if loaded_plugins["nvim-window-picker"] then
	local picker = require("window-picker")
	vim.keymap.set("n", "<leader>wp", function()
		local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
		vim.api.nvim_set_current_win(picked_window_id)
	end, mapping_options)
end

-- Smart Splits
if loaded_plugins["smart-splits.nvim"] then
	local smart_splits = require("smart-splits")
	vim.keymap.set({ "n", "i" }, "<C-h>", function()
		smart_splits.move_cursor_left()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-j>", function()
		smart_splits.move_cursor_down()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-k>", function()
		smart_splits.move_cursor_up()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-l>", function()
		smart_splits.move_cursor_right()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Left>", function()
		smart_splits.resize_left()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Down>", function()
		smart_splits.resize_down()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Up>", function()
		smart_splits.resize_up()
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Right>", function()
		smart_splits.resize_right()
	end, mapping_options)
else
	vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", mapping_options)

	vim.keymap.set({ "n", "i" }, "<C-Left>", "<CMD>resize -2<CR>", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Down>", "<CMD>resize +2<CR>", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Up>", "<CMD>vertical resize -2<CR>", mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-Right>", "<CMD>vertical resize +2<CR>", mapping_options)
end

if loaded_plugins["bufdelete.nvim"] then
	local buffer_delete = require("bufdelete")
	vim.keymap.set("n", "<leader>bd", function()
		buffer_delete.bufdelete()
	end, mapping_options)
end

vim.keymap.set("n", "<leader>b|", vim.cmd.vsplit, mapping_options)
vim.keymap.set("n", "<leader>b-", vim.cmd.split, mapping_options)

if loaded_plugins["nvim-notify"] then
	local notify = require("notify")
	vim.keymap.set("n", "<leader>un", function()
		notify.dismiss({ silent = true, pending = true })
	end, mapping_options)
end

if loaded_plugins["telescope.nvim"] then
	local builtin = require("telescope.builtin")
	local extensions = require("telescope").extensions
	vim.keymap.set("n", "<leader>ff", builtin.find_files, mapping_options)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, mapping_options)
	vim.keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, mapping_options)
	vim.keymap.set("n", "<leader>fb", builtin.buffers, mapping_options)
	vim.keymap.set("n", "<leader>fn", extensions.notify.notify, mapping_options)
end

if loaded_plugins["LuaSnip"] then
	local luasnip = require("luasnip")
	vim.keymap.set({ "n", "i" }, "<C-;>", function()
		luasnip.jump(1)
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-'>", function()
		luasnip.jump(-1)
	end, mapping_options)
end

vim.keymap.set("n", "<space>el", vim.diagnostic.open_float, mapping_options)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, mapping_options)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, mapping_options)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, mapping_options)

if loaded_plugins["trouble.nvim"] then
	vim.keymap.set("n", "<leader>ee", "<cmd>TroubleToggle<cr>", mapping_options)
	vim.keymap.set("n", "<leader>ew", "<cmd>TroubleToggle workspace_diagnostics<cr>", mapping_options)
	vim.keymap.set("n", "<leader>ed", "<cmd>TroubleToggle document_diagnostics<cr>", mapping_options)
end
