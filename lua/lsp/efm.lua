local eslint = {
	prefix = "eslint",
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

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
	javascript = { eslint },
	javascriptreact = { eslint },
	["javascript.jsx"] = { eslint },
	typescript = { eslint },
	["typescript.tsx"] = { eslint },
	typescriptreact = { eslint },
	json = { json_prettier, json_jq },
}
