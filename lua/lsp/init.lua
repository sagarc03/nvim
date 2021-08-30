require("lsp.formatting")
require("lsp.python")

local nvim_lsp = require("lspconfig")
local lspinstall = require("lspinstall")
local saga = require("lspsaga")
local lsp_status = require("lsp-status")
local coq = require("coq")

lsp_status.register_progress()
saga.init_lsp_saga()
lspinstall.setup()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	-- Mappings.
	buf_set_keymap("n", "gd", [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], opts)
	buf_set_keymap("n", "gr", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
	buf_set_keymap("n", "gs", [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>]], opts)
	buf_set_keymap("n", "K", [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], opts)

	buf_set_keymap("n", "<leader>ca", [[<cmd>lua require'lspsaga.codeaction'.code_action()<CR>]], opts)
	buf_set_keymap("v", "<leader>ca", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)
	buf_set_keymap("n", "<leader>rn", [[<cmd>lua require'lspsaga.rename'.rename()<CR>]], opts)

	buf_set_keymap("n", "<leader>q", [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]], opts)
	buf_set_keymap("n", "<leader>e", [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
	buf_set_keymap("n", "[e", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
	buf_set_keymap("n", "]e", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)

	buf_set_keymap("n", "<leader>ot", [[<cmd>lua require'lspsaga.floaterm'.open_float_terminal()<CR>]], opts)
	buf_set_keymap("t", "<leader>ct", [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], opts)
	-- vim.api.nvim_set_keymap(
	--     "t",
	--     "<leader>ct",
	--     [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]],
	--     opts
	-- )
	lsp_status.on_attach(client)
	vim.cmd([[COQnow -s]])
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _)
	local config = {
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	}
	local uri = params.uri
	local bufnr = vim.uri_to_bufnr(uri)

	if not bufnr then
		return
	end

	local diagnostics = params.diagnostics

	for i, v in ipairs(diagnostics) do
		if v.source == nil or v.source == "" then
			diagnostics[i].message = string.format("%s", v.message)
		else
			diagnostics[i].message = string.format("[%s] %s", v.source, v.message)
		end
	end

	vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end

	vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
end

local servers = lspinstall.installed_servers()

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
		on_attach = on_attach,
		capabilities = lsp_status.capabilities,
	}))
end

nvim_lsp.lua.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "exepath" },
			},
		},
	},
}))

local languages = require("lsp.efm")

nvim_lsp.efm.setup({
	root_dir = nvim_lsp.util.root_pattern("yarn.lock", "package.json", ".git", "pyproject.toml"),
	filetypes = vim.tbl_keys(languages),
	init_options = { documentFormatting = true, codeAction = true },
	settings = { languages = languages, log_level = 1, log_file = "~/efm.log" },
})

local python = require("lsp.python")

nvim_lsp.python.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	capabilities = lsp_status.capabilities,
	before_init = function(_, config)
		python.set_poetry_virtual_env()
	end,
}))
