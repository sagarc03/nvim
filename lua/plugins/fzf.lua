return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "FzfLua",
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({})
	end,
	lazy = true,
	keys = {
		{ "<leader>ff", "<CMD>FzfLua files<CR>" },
		{ "<leader>fg", "<CMD>FzfLua live_grep<CR>" },
		{ "<leader>s", "<CMD>FzfLua lgrep_curbuf<CR>" },
		{ "<leader>fb", "<CMD>FzfLua buffers<CR>" },
		{ "<leader>fr", "<CMD>FzfLua resume<CR>" },

		-- lsp
		{ "gD", "<CMD>FzfLua lsp_declarations<CR>" },
		{ "gd", "<CMD>FzfLua lsp_definitions<CR>" },
		{ "gt", "<CMD>FzfLua lsp_typedefs<CR>" },
		{ "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>" },
		{ "gr", "<CMD>FzfLua lsp_references<CR>" },
		{ "gi", "<CMD>FzfLua lsp_implementations<CR>" },
	},
}
