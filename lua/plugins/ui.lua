return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
		lazy = false,
		keys = {
			{
				"<leader>un",
				function()
					local notify = require("notify")
					notify.dismiss({ silent = true, pending = true })
				end,
			},
		},
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
}
