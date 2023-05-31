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
	-- vim.keymap.set("t", "<C-h>", [[<C-\><C-n><CMD>wincmd h<CR>]], mapping_options)
	-- vim.keymap.set("t", "<C-j>", [[<C-\><C-n><CMD>wincmd j<CR>]], mapping_options)
	-- vim.keymap.set("t", "<C-k>", [[<C-\><C-n><CMD>wincmd k<CR>]], mapping_options)
	-- vim.keymap.set("t", "<C-l>", [[<C-\><C-n><CMD>wincmd l<CR>]], mapping_options)
end

if loaded_plugins["hop.nvim"] then
	vim.keymap.set("n", "$", function()
		require("hop").hint_words()
	end, mapping_options)
	vim.keymap.set("n", "<leader>s", function()
		require("hop").hop.hint_char1()
	end, mapping_options)
	vim.keymap.set("n", "<leader>/", function()
		require("hop").hop.hint_patterns()
	end, mapping_options)
	vim.keymap.set("n", "<leader>l", function()
		require("hop").hop.hint_lines()
	end, mapping_options)
	vim.keymap.set("n", "f", function()
		local hint = require("hop.hint")
		require("hop").hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("n", "F", function()
		local hint = require("hop.hint")
		require("hop").hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("o", "f", function()
		local hint = require("hop.hint")
		require("hop").hint_char1({ direction = hint.HintDirection.AFTER_CURSOR, current_line_only = true })
	end, mapping_options)
	vim.keymap.set("o", "F", function()
		local hint = require("hop.hint")
		require("hop").hint_char1({ direction = hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
	end, mapping_options)
end

if loaded_plugins["nvim-window-picker"] then
	vim.keymap.set("n", "<leader>wp", function()
		local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
		vim.api.nvim_set_current_win(picked_window_id)
	end, mapping_options)
end

-- Smart Splits
if loaded_plugins["smart-splits.nvim"] then
	vim.keymap.set({ "n", "i", "v" }, "<C-h>", function()
		require("smart-splits").move_cursor_left()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-j>", function()
		require("smart-splits").move_cursor_down()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-k>", function()
		require("smart-splits").move_cursor_up()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-l>", function()
		require("smart-splits").move_cursor_right()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-h>", function()
		require("smart-splits").resize_left()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-j>", function()
		require("smart-splits").resize_down()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-k>", function()
		require("smart-splits").resize_up()
	end, mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-l>", function()
		require("smart-splits").resize_right()
	end, mapping_options)
else
	vim.keymap.set({ "n", "i", "v" }, "<C-h>", "<C-w>h", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-j>", "<C-w>j", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-k>", "<C-w>k", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<C-l>", "<C-w>l", mapping_options)

	vim.keymap.set({ "n", "i", "v" }, "<A-h>", "<CMD>resize -2<CR>", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-j>", "<CMD>resize +2<CR>", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-k>", "<CMD>vertical resize -2<CR>", mapping_options)
	vim.keymap.set({ "n", "i", "v" }, "<A-l>", "<CMD>vertical resize +2<CR>", mapping_options)
end

if loaded_plugins["bufdelete.nvim"] then
	vim.keymap.set("n", "<leader>bd", function()
		require("bufdelete").bufdelete()
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
	vim.keymap.set("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, mapping_options)
	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").live_grep()
	end, mapping_options)
	vim.keymap.set("n", "<leader>fw", function()
		require("telescope.builtin").current_buffer_fuzzy_find()
	end, mapping_options)
	vim.keymap.set("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, mapping_options)
	vim.keymap.set("n", "<leader>fn", function()
		require("telescope").extensions.notify.notify()
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

if loaded_plugins["neogen"] then
	vim.keymap.set("n", "ga", function()
		require("neogen").generate()
	end, mapping_options)
end
