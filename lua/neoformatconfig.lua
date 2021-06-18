local g = vim.g

g.neoformat_run_all_formatters = 1

vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

-- Python formatters
g.neoformat_enabled_python = {"black", "isort"}
