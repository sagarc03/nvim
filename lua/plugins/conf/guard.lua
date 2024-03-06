local local_prettier = {
	cmd = "./node_modules/.bin/prettier",
	args = { "--stdin-filepath" },
	fname = true,
	stdin = true,
}

return function()
	local ft = require("guard.filetype")

	-- use clang-format and clang-tidy for c files
	-- ft("c"):fmt("clang-format"):lint("clang-tidy")

	-- use stylua to format lua files and no linter

	ft("typescript,javascript,typescriptreact,svelte,json"):fmt(local_prettier)

	-- call setup LAST
	require("guard").setup({
		-- the only option for the setup function
		fmt_on_save = true,
		-- Use lsp if no formatter was defined for this filetype
		lsp_as_default_formatter = false,
	})
end
