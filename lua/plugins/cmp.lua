local cmp_opts = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local mapping_options = { silent = true, noremap = true }
	vim.keymap.set({ "n", "i" }, "<C-;>", function()
		luasnip.jump(1)
	end, mapping_options)
	vim.keymap.set({ "n", "i" }, "<C-'>", function()
		luasnip.jump(-1)
	end, mapping_options)
	return {
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol_text",
				symbol_map = { Supermaven = "" },
				-- menu = {
				-- 	buffer = "[Buffer ✏️]",
				-- 	nvim_lsp = "[LSP ⚙️]",
				-- 	luasnip = "[LuaSnip 🏭]",
				-- 	nvim_lua = "[NvimLua 🌍]",
				-- 	path = "[Path 📁]",
				-- 	emoji = "[Emoji 😄]",
				-- 	supermaven = "[AI 🧠]",
				-- },
			}),
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<C-CR>"] = cmp.mapping.confirm({ select = true }),
			["<S-CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp_signature_help", max_item_count = 5 },
			{ name = "luasnip", max_item_count = 5 },
			{
				name = "nvim_lsp",
				max_item_count = 10,
				entry_filter = function(entry)
					return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
				end,
			},
			{ name = "supermaven", max_item_count = 5 },
			{ name = "nvim_lua", max_item_count = 5 },
			{ name = "buffer", max_item_count = 5 },
			{ name = "path", max_item_count = 5 },
			{ name = "emoji", max_item_count = 5 },
		}),
	}
end

return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = require("plugins.conf.luasnip_conf"),
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = cmp_opts,
		config = require("plugins.conf.cmp_conf"),
	},
	{
		"supermaven-inc/supermaven-nvim",
		opts = {
			disable_inline_completion = true, -- disables inline completion for use with cmp
			disable_keymaps = true, -- disables built in keymaps for more manual control
		},
	},
}
