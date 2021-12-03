local gps = require("nvim-gps")

gps.setup({
	separator = " > ",
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "moonlight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "diff", "filename", { gps.get_location, condition = gps.is_available } },
		lualine_x = { { "require('lsp-status').status()", condition = #vim.lsp.buf_get_clients() > 0 }, "filetype" },
		lualine_y = { "progress" },
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
	extensions = {},
})
