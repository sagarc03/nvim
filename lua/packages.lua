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
	use("Pocco81/Catppuccino.nvim")

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"hoob3rt/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})

	-- LSP and similar functions
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"kabouzeid/nvim-lspinstall",
		},
	})
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("nvim-lua/lsp-status.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })

	use({ "fatih/vim-go", run = ":GoInstallBinaries" })
	use("sbdchd/neoformat")

	-- Lua
	use("ahmedkhalf/project.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = "python3 -m chadtree deps",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"tiagofumo/vim-nerdtree-syntax-highlight",
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

	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- Surround
	use("blackCauldron7/surround.nvim")
	-- Better Comments
	use("b3nj5m1n/kommentary")

	use("glepnir/dashboard-nvim")

	use("akinsho/toggleterm.nvim")
	use("beauwilliams/focus.nvim")

	use("p00f/nvim-ts-rainbow")
	use("sindrets/diffview.nvim")
end)
