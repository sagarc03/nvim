local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", "<CMD>LspUI hover<CR>", bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>rn", "<CMD>LspUI rename<CR>", bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

return function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	require("go").setup({
		-- other setups ....
		lsp_cfg = {
			capabilities = capabilities,
			-- other setups
		},
		lsp_inlay_hints = {
			enable = false,
		},
		lsp_on_attach = on_attach,
		trouble = true, -- true: use trouble to open quickfix
		luasnip = true, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
	})

	local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			require("go.format").goimport()
		end,
		group = format_sync_grp,
	})
end
