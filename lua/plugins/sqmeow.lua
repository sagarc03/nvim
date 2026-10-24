local sql_ft = { "sql", "mysql", "plsql" }
local sql_dialect = "postgres" -- sqlfluff dialect: postgres, mysql, sqlite, bigquery, ansi, ...

-- disable nvim's builtin sql_completion so it doesn't fight blink.cmp's omni source
vim.g.omni_sql_default_compl_type = "syntax"
vim.g.loaded_sql_completion = true

---@type LazySpec
return {
  {
    "2giosangmitom/sqmeow.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    version = "*",
    build = function() require("sqmeow").install() end,
    opts = {},
    cmd = "Sqmeow",
    keys = {
      { "<Leader>Dd", "<Cmd>Sqmeow toggle<CR>", desc = "Toggle" },
      { "<Leader>Dc", "<Cmd>Sqmeow cancel<CR>", desc = "Cancel" },
      { "<Leader>Da", "<Cmd>Sqmeow add<CR>", desc = "Add Connection" },
      { "<Leader>Ds", "<Cmd>Sqmeow scratch<CR>", desc = "New Scratchpad" },
    },
  },

  -- db-aware completion (schemas/tables/columns); source self-disables when no connection is selected
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "sqmeow" },
        providers = { sqmeow = { name = "Sqmeow", module = "sqmeow.completion.blink" } },
      },
    },
  },

  {
    "AstroNvim/astrocore",
    opts = {
      mappings = { n = { ["<Leader>D"] = { desc = "󰆼 Database" } } },
    },
  },

  -- override astrocommunity.pack.sql's sqlfluff handler: it passes no --dialect and only covers ft=sql
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        sqlfluff = function()
          local null_ls = require "null-ls"
          local args = { extra_args = { "--dialect", sql_dialect }, filetypes = sql_ft }
          null_ls.register(null_ls.builtins.diagnostics.sqlfluff.with(args))
          null_ls.register(null_ls.builtins.formatting.sqlfluff.with(args))
        end,
      },
    },
  },
}
