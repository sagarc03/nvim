local eslint = {
	prefix = "eslint",
	lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
	lintIgnoreExitCode = true,
}

local js_prettier = { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }

local pylint = {
	prefix = "pylint",
	lintCommand = "pylint --output-format=text --score=no --msg-template '{path}:{line}:{column}:{C}:{msg} [{symbol}] [{msg_id}]' ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c:%t:%m" },
	lintOffsetColumns = 1,
	lintCategoryMap = { I = "H", R = "I", C = "I", W = "W", E = "E", F = "E" },
}

local mypy = {
	prefix = "mypy",
	lintCommand = "mypy --show-column-numbers",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %trror:%m", "%f:%l:%c: %tarning:%m", "%f:%l:%c: %tote:%m" },
}

local black = {
	prefix = "black",
	formatCommand = "black --quiet -",
	formatStdin = true,
}

local isort = {
	prefix = "isort",
	formatCommand = "isort --quiet -",
	formatStdin = true,
}

local stylua = {
	prefix = "stylua",
	formatCommand = "stylua -",
	formatStdin = true,
}

local json_prettier = {
	prefix = "prettier",
	formatCommand = "prettier ${--tab-width:tabWidth} --parser json",
	formatStdin = true,
}

local json_jq = {
	prefix = "jq",
	lintCommand = "jq .",
	lintStdin = true,
}

return {
	lua = { stylua },
	python = { pylint, mypy, black, isort },
	javascript = { eslint, js_prettier },
	javascriptreact = { eslint, js_prettier },
	["javascript.jsx"] = { eslint, js_prettier },
	typescript = { eslint, js_prettier },
	["typescript.tsx"] = { eslint, js_prettier },
	typescriptreact = { eslint, js_prettier },
	json = { json_prettier, json_jq },
}
