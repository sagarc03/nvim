vim.g.mapleader = " "
vim.g.poetv_executables = { "poetry" }
vim.g.poetv_auto_activate = "1"

require("neovide")
require("packages")
require("general")
require("treesitter")
require("lsp")
require("statusline")
require("root")
require("telescopeconfig")
require("tabbar")
require("mapping")
require("file_explorer")
require("dashboard")
require("term")
require("scope")
require("git")
require("zen")

-- Theme
require("tokyonight").setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	styles = {
		comments = { italic = true },
		keywords = { italic = true, bold = true },
		functions = { bold = true },
		variables = {},
	},
})
vim.cmd("colorscheme tokyonight")

require("Comment").setup()
require("mini.surround").setup({
	-- Add custom surroundings to be used on top of builtin ones. For more
	-- information with examples, see `:h MiniSurround.config`.
	custom_surroundings = nil,

	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "sa", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`
	},

	-- Number of lines within which surrounding is searched
	n_lines = 50,

	-- How to search for surrounding (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest'. For more details, see `:h MiniSurround.config`.
	search_method = "cover",
})
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})
require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
})

local ufo_disable_filetypes = {
	startup = "",
	packer = "",
	toggleterm = "",
	SidebarNvim = "",
	DiffviewFiles = "",
	NvimTree = "",
	qf = "",
}
-- Lua
require("ufo").setup({
	provider_selector = function(_, ft, _)
		return ufo_disable_filetypes[ft] or { "treesitter", "indent" }
	end,
})

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "gK", function()
	require("ufo").peekFoldedLinesUnderCursor()
end)
