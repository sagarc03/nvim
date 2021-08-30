require("packages")
require("lsp")
require("mapping")
require("general")
require("ctree")
require("telescopeconfig")
require("navigation")
require("statusline")
require("dashboard")
require("term")
require("bufferlineconfig")

vim.cmd([[colorscheme onedark]])

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true
    }
}
