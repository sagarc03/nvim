CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

O = {
    format_on_save = true,
    number = true,
    relativenumber = true,
    splitbelow = true,
    splitright = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    smarttab = true,
    expandtab = true,
    smartindent = true,
    autoindent = true,

    showtabline = 2,
    termguicolors = true
}
