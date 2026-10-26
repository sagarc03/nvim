return {
  {
    "2giosangmitom/sqmeow.nvim",
    version = "*",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function()
      require("sqmeow").install()
    end,
    opts = {},
    cmd = "Sqmeow",
    keys = {
      { "<leader>D", "", desc = "+database" },
      { "<leader>Dd", "<Plug>(sqmeow-toggle)", desc = "Toggle sqmeow" },
      { "<leader>Da", "<Plug>(sqmeow-add-connection)", desc = "Add connection" },
      { "<leader>Ds", "<Plug>(sqmeow-scratch)", desc = "New scratchpad" },
      { "<leader>Df", "<Plug>(sqmeow-result-float)", desc = "Result float" },
      { "<leader>Dx", "<Plug>(sqmeow-cancel)", desc = "Cancel query" },
    },
  },
}
