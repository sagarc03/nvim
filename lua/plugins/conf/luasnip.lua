return function(config, opts) 
  local luasnip = require("luasnip")

  luasnip.setup(opts)
	luasnip.filetype_extend("all", { "_" })

	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()

end
