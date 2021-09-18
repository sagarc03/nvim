local g = vim.g

g.neoformat_run_all_formatters = 1

-- Python formatters
g.neoformat_enabled_python = { "black", "isort" }
g.neoformat_enabled_yaml = { "prettier" }
g.neoformat_enabled_html = { "prettier" }
g.neoformat_enabled_css = { "prettier" }
g.neoformat_enabled_javascript = { "prettier" }
g.neoformat_enabled_typescript = { "prettier" }
g.neoformat_enabled_markdown = { "prettier" }
g.neoformat_enabled_lua = { "stylua" }
g.neoformat_enabled_go = { "gofmt", "goimports" }

vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
