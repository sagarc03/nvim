vim.g.mapleader = " "

require("general")
require("treesitter")
require("packages")
require("statusline")
require("lsp")
require("root")
require("telescopeconfig")
require("tabbar")
require("mapping")
require("file_explorer")
require("dashboard")
require("term")
require("scope")
require("git")
-- require("wilder")

-- Default options:
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "bold",
    keywordStyle = "bold",
    statementStyle = "bold",
    typeStyle = "bold",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

-- Auto Activate poetry virtual env
vim.g.poetv_auto_activate = "1"

require("Comment").setup()
require("gitsigns").setup()
require("surround").setup({ mappings_style = "sandwich" })
require("sad").setup({
	diff = "delta", -- you can use `diff`, `diff-so-fancy`
	ls_file = "fd", -- also git ls_file
	exact = true, -- exact match
})
