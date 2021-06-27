local nvim_lsp = require('lspconfig')
local lspinstall = require('lspinstall')
local saga = require("lspsaga")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    --
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', [[<cmd>lua require'lspsaga.provider'.show_definition()<CR>]], opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'K', [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gs', [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], opts)

    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', [[<cmd>lua require'lspsaga.rename'.rename()<CR>]], opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    buf_set_keymap('n', '<space>e', [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
    buf_set_keymap('n', '[e', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
    buf_set_keymap('n', ']e', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)

    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    buf_set_keymap('n', '<leader>ot', [[<cmd>lua require'lspsaga.floaterm'.open_float_terminal()<CR>]], opts)
    buf_set_keymap('t', '<leader>ct', [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], opts)
    vim.api.nvim_set_keymap('t', '<leader>ct', [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], opts)

-- nnoremap <silent><leader>clf :Lspsaga lsp_finder<CR>
-- nnoremap <silent><leader>cca :Lspsaga code_action<CR>
-- vnoremap <silent><leader>cca :<C-U>Lspsaga range_code_action<CR>
-- nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
-- nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
-- nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
-- nnoremap <silent><leader>crn :Lspsaga rename<CR>
-- nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
-- nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
-- nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
-- nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
-- nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
-- tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR>

end

-- Change diagnostic signs.
-- vim.fn.sign_define('LspDiagnosticsSignError', { text = "x", texthl = "LspDiagnosticsDefaultError" })
-- vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "!", texthl = "LspDiagnosticsDefaultWarning" })
-- vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
-- vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

saga.init_lsp_saga()
lspinstall.setup()

require('lint').linters_by_ft = {
  python = {"pylint", "mypy"}
}


-- vim.api.nvim_command([[au BufWritePost *.py lua require('lint').try_lint()]])


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = lspinstall.installed_servers()
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end

nvim_lsp.lua.setup{
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim", "exepath"}
            }
        }
    }
}

local function split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

local function run_local_command(s)
    local handle =  io.popen(s)
    local result = handle:read("*a")
    handle:close()
    return result
end

local function get_python_path()
  local poetry_path = split(run_local_command("poetry env list --full-path"), " ")[1]
  poetry_path = poetry_path:gsub("%s+", "")
  if poetry_path ~= '' then
      poetry_path = poetry_path .. "/bin/python"
      return poetry_path
  end

  local pyenv_path = run_local_command("pyenv which python")
  if pyenv_path ~= '' then
      print(pyenv_path)
      return pyenv_path
  end
  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

nvim_lsp.pyright.setup({
    on_attach = on_attach,
    -- before_init = function(params, config)
    --     config.settings.python.pythonPath = get_python_path()
    --     config.cmd_env = { PYTHONPATH = get_python_path() }
    --     return params, config
    -- end
})


nvim_lsp.latex.setup{
    on_attach = on_attach
}

nvim_lsp.go.setup{
    on_attach = on_attach
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach
}



nvim_lsp.efm.setup{ 
    -- before_init = function(params, config)
    --     config.cmd_env = { PYTHONPATH = get_python_path() }
    --     return params, config
    -- end
}
