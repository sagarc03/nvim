local cmp_opts = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local mapping_options = { silent = true, noremap = true }
  vim.keymap.set({ "n", "i" }, "<C-;>", function()
    luasnip.jump(1)
  end, mapping_options)
  vim.keymap.set({ "n", "i" }, "<C-'>", function()
    luasnip.jump(-1)
  end, mapping_options)
  return {
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text",
        menu = {
          buffer = "[Buffer ✏️]",
          nvim_lsp = "[LSP ⚙️]",
          luasnip = "[LuaSnip 🏭]",
          nvim_lua = "[NvimLua 🌍]",
          path = "[Path 📁]",
          emoji = "[Emoji 😄]",
        },
      }),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<S-CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp_signature_help" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      { name = "emoji" },
    }),
  }
end

return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = require("plugins.conf.luasnip_conf"),
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = cmp_opts,
    config = require("plugins.conf.cmp_conf"),
  },
}
