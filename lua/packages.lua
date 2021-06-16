return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use { "nvim-treesitter/nvim-treesitter" run = ":TSUpdate"}

    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "onsails/lspkind-nvim"
    use "sbdchd/neoformat"
    use "nvim-lua/plenary.nvim"
    use "kabouzeid/nvim-lspinstall"

    use "lewis6991/gitsigns.nvim"
    use "akinsho/nvim-bufferline.lua"
    use "glepnir/galaxyline.nvim"
    use "windwp/nvim-autopairs"
    use "alvan/vim-closetag"
end)
