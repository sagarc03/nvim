local nvim_lsp = require("lspconfig")
local lspinstall = require("lspinstall")
local saga = require("lspsaga")
local lsp_status = require("lsp-status")
local coq = require("coq")
lsp_status.register_progress()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    --
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap("n", "gd", [[<cmd>lua require'lspsaga.provider'.show_definition()<CR>]], opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap("n", "K", [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap("n", "gs", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], opts)

    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", [[<cmd>lua require'lspsaga.rename'.rename()<CR>]], opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    buf_set_keymap("n", "<space>e", [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
    buf_set_keymap("n", "[e", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
    buf_set_keymap("n", "]e", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)

    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    buf_set_keymap("n", "<leader>ot", [[<cmd>lua require'lspsaga.floaterm'.open_float_terminal()<CR>]], opts)
    buf_set_keymap("t", "<leader>ct", [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], opts)
    vim.api.nvim_set_keymap(
        "t",
        "<leader>ct",
        [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]],
        opts
    )
    lsp_status.on_attach(client)
    vim.cmd [[COQnow -s]]

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

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false
    }
)

saga.init_lsp_saga()
lspinstall.setup()

local servers = lspinstall.installed_servers()
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(
        coq.lsp_ensure_capabilities(
            {
                on_attach = on_attach,
                capabilities = lsp_status.capabilities
            }
        )
    )
end

nvim_lsp.lua.setup(
    coq.lsp_ensure_capabilities(
        {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim", "exepath"}
                    }
                }
            }
        }
    )
)
