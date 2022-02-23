local eslint = {
	prefix = "eslint",
	lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
	lintIgnoreExitCode = true,
}

local js_prettier = {
	formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local vue_prettier = {
	formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local scss_prettier = {
	formatCommand = "./node_modules/.bin/prettier --parser scss",
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
	formatCommand = "./node_modules/.bin/prettier ${--tab-width:tabWidth} --parser json",
	formatStdin = true,
}

local html_prettier = {
	formatCommand = "./node_modules/.bin/prettier ${--tab-width:tabWidth} ${--single-quote:singleQuote} --parser html",
	formatStdin = true,
}

local json_jq = {
	prefix = "jq",
	lintCommand = "jq .",
	lintStdin = true,
}

local css_lang_server = {
	prefix = "css_lang_server",
	lintCommand = "css-languageserver --stdio",
	-- lintStdin = true,
	-- lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
	-- lintIgnoreExitCode = true,
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
	html = { html_prettier },
	css = { css_lang_server },
	scss = { scss_prettier, css_lang_server },
	vue = { vue_prettier, eslint },
}
