local function line_progress()
	local winid = vim.g.statusline_winid
	local current_line = vim.api.nvim_win_get_cursor(winid)[1]
	local total_line = vim.api.nvim_buf_line_count(vim.fn.winbufnr(winid))
	return tostring(math.ceil((current_line / total_line) * 100)) .. "%%"
end

local gps = require("nvim-gps")
gps.setup({
	separator = " > ",
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = { "dashboard" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "diff", "filename", { gps.get_location, condition = gps.is_available } },
		lualine_x = { require("lsp-status").status, "filetype" },
		lualine_y = { line_progress },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "chadtree" },
})
