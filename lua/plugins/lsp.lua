return {
  {
    "danymat/neogen",
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    opts = {
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "reST", -- for a full list of annotation_conventions, see supported-languages below,
          },
        },
      },
    },
    cmd = { "Neogen" },
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
    },
    config = require("plugins.conf.go"),
    event = { "BufReadPre", "BufNewFile" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "petobens/poet-v",
    ft = "python",
  },
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "simrat39/rust-tools.nvim",
      "j-hui/fidget.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = require("plugins.conf.lsp"),
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require("plugins.conf.null_ls"),
  },

  {
    "folke/trouble.nvim",
    lazy = true,
  },
  {
    "lewis6991/hover.nvim",
    config = require("plugins.conf.hover"),
  },
}
