local install_path = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

local packer = require("packer")
local use = packer.use

return packer.startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Themes
	-- use("Pocco81/Catppuccino.nvim")
	-- use("folke/tokyonight.nvim")
	-- use("jacoborus/tender.vim")
	-- use("bluz71/vim-nightfly-guicolors")
	use("rmehri01/onenord.nvim")

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use("SmiteshP/nvim-gps")

	-- LSP and similar functions
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
		},
	})
	use("nvim-lua/lsp-status.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use("ray-x/lsp_signature.nvim")
	use({
		"ray-x/navigator.lua",
		requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
		},
	})

	use({ "L3MON4D3/LuaSnip", requires = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" } })

	use("sbdchd/neoformat")

	-- Lua
	use("ahmedkhalf/project.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"xiyaowong/telescope-emoji.nvim",
			"edolphin-ydf/goimpl.nvim",
		},
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	--[[ use({
		"mrjones2014/dash.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		run = "make install",
		disable = not vim.fn.has("macunix"),
	}) ]]

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use({
		"akinsho/nvim-bufferline.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use("windwp/nvim-autopairs")
	use("alvan/vim-closetag")

	use({ "petobens/poet-v", ft = "python" })

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Text Navigation and Jumping
	use("unblevable/quick-scope")

	use({ "phaazon/hop.nvim", as = "hop" })

	-- Surround
	use("blackCauldron7/surround.nvim")
	-- Better Comments
	use("b3nj5m1n/kommentary")

	use("glepnir/dashboard-nvim")

	use("akinsho/toggleterm.nvim")
	use("beauwilliams/focus.nvim")

	use("p00f/nvim-ts-rainbow")
	use("sindrets/diffview.nvim")
	use({ "lewis6991/spellsitter.nvim" })

	-- Language Specific
	use({ "ray-x/go.nvim" })
	use({ "sidebar-nvim/sidebar.nvim" })

	-- ORG MODE
	use({ "kristijanhusak/orgmode.nvim" })

	-- Lua
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins" })
end)
