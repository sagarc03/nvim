local is_lsp_attached = function()
	if next(vim.lsp.get_active_clients({ bufnr = 0 })) == nil then
		return false
	end

	if
		#vim.lsp.get_active_clients({ bufnr = 0 }) == 1
		and vim.lsp.get_active_clients({ bufnr = 0 })[1].name == "null-ls"
	then
		return false
	end

	return true
end

local is_null_ls_attached = function()
	if next(vim.lsp.get_active_clients({ bufnr = 0 })) == nil then
		return false
	end
	local client = require("null-ls.client").get_client()
	local bufnr = vim.api.nvim_get_current_buf()
	local is_attached = true
	if not client or not vim.lsp.buf_is_attached(bufnr, client.id) then
		is_attached = false
	end
	return is_attached
end

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
				},
				lualine_x = {
					{
						cond = is_null_ls_attached,
						function()
							local sources = require("null-ls.sources")
							local filetype = vim.api.nvim_buf_get_option(0, "filetype")
							local names = {}
							for _, server in pairs(sources.get_available(filetype)) do
								table.insert(names, server.name)
							end
							return " [" .. table.concat(names, " ") .. "]"
						end,
						color = { bold = true },
					},

					{
						cond = is_lsp_attached,
						function()
							local names = {}
							for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
								if server.name ~= "null-ls" then
									table.insert(names, server.name)
								end
							end
							return " [" .. table.concat(names, " ") .. "]"
						end,
						color = { bold = true },
					},
				},
				lualine_y = {
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_z = { "progress", "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = { "neo-tree", "toggleterm", "trouble", "fzf" },
		},
	},
}
