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

return packer.startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Themes
        use "morhetz/gruvbox"
        use "ueaner/molokai"
        use "joshdick/onedark.vim"
        use "ghifarit53/tokyonight-vim"
        use "arcticicestudio/nord-vim"

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use {
            "glepnir/galaxyline.nvim",
            branch = "main",
            config = function()
            end,
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        -- LSP and similar functions
        use {
            "neovim/nvim-lspconfig",
            requires = {
                "kabouzeid/nvim-lspinstall",
                "onsails/lspkind-nvim",
                "mfussenegger/nvim-lint",
                "glepnir/lspsaga.nvim",
                "nvim-lua/lsp-status.nvim"
            }
        }
        use {
            "ahmedkhalf/lsp-rooter.nvim",
            config = function()
                require("lsp-rooter").setup {}
            end
        }
        use {"ms-jpq/coq_nvim", branch = "coq"}
        use {"ms-jpq/coq.artifacts", branch = "artifacts"}
        use "sbdchd/neoformat"
        use "editorconfig/editorconfig-vim"

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"}
            }
        }
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
        }

        use "akinsho/nvim-bufferline.lua"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"

        use {"petobens/poet-v", ft = "python"}
        use "caenrique/nvim-toggle-terminal"

        use {
            "tpope/vim-fugitive",
            requires = {
                use "junegunn/gv.vim",
                use "rhysd/git-messenger.vim"
            }
        }

        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            },
            config = function()
                require("gitsigns").setup()
            end
        }

        -- Text Navigation and Jumping
        use "unblevable/quick-scope"
        use "easymotion/vim-easymotion"

        -- Surround
        use "tpope/vim-surround"
        -- Better Comments
        use "tpope/vim-commentary"
        use "mhinz/vim-startify"
        use "kyazdani42/nvim-web-devicons"
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {}
            end
        }
        -- use {
        --     "projekt0n/github-nvim-theme",
        --     config = function()
        --         require("github-theme").setup()
        --     end
        -- }
    end
)
