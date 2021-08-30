require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "catppuccino",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = { "dashboard" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "diff", "filename" },
		lualine_x = { require("lsp-status").status, "filetype" },
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
	extensions = { "chadtree" },
})
