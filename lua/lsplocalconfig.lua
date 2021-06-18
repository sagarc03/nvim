local nvim_lsp = require('lspconfig')
local lspinstall = require('lspinstall')

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
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap("n", "<space>cx", ":LspDiagnosticsAll<CR>", opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Change diagnostic signs.
vim.fn.sign_define('LspDiagnosticsSignError', { text = "x", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "!", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)

lspinstall.setup()

require('lspfuzzy').setup {}

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

local function get_python_path()
  local handle =  io.popen("poetry env list --full-path")
  local poetry_paths = handle:read("*a")
  handle:close()
  local poetry_path = split(poetry_paths, " ")[1]
  if poetry_path ~= '' then
      return poetry_path
  end
  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end


nvim_lsp.pyright.setup{
    on_attach = on_attach,
    on_init = function(_, config) config.settings.python.pythonPath = get_python_path() end
}

require('lint').linters_by_ft = {
  python = {"pylint", "mypy"}
}

vim.api.nvim_command([[au BufWritePost *.py lua require('lint').try_lint()]])

