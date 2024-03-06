return function()
	local lint = require("lint")
	lint.linters_by_ft = {
		-- markdown = { "vale" },
		python = { "ruff", "mypy" },
		-- lua = { "luacheck" },
		go = { "golangcilint" },
		javascript = { "eslint" },
		javascriptreact = { "eslint" },
		typescript = { "eslint" },
		typescriptreact = { "eslint" },
		astro = { "eslint" },
		["*"] = { "typos" },
	}
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			lint.try_lint()
		end,
	})
end
