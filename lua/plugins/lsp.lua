return {

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
		},
		config = require("plugins.conf.go"),
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	{
		"petobens/poet-v",
		ft = "python",
	},

	"hrsh7th/cmp-nvim-lsp",
	"b0o/SchemaStore.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"simrat39/rust-tools.nvim",
	"j-hui/fidget.nvim",

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins.conf.lsp"),
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins.conf.null_ls"),
	},

	"folke/trouble.nvim",
}
