local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    prefix = "eslint",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local pylint = {
    lintCommand = "pylint --output-format=text --score=no --msg-template '{path}:{line}:{column}:{C}:{msg} [{symbol}] [{msg_id}]' ${INPUT}",
    prefix = "pylint",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c:%t:%m"},
    lintOffsetColumns = 1,
    lintCategoryMap = {I = "H", R = "I", C = "I", W = "W", E = "E", F = "E"}
}

local mypy = {
    prefix = "mypy",
    lintCommand = "mypy --show-column-numbers",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %trror:%m", "%f:%l:%c: %tarning:%m", "%f:%l:%c: %tote:%m"}
}

return {
    python = {pylint, mypy},
    javascript = {eslint},
    javascriptreact = {eslint},
    ["javascript.jsx"] = {eslint},
    typescript = {eslint},
    ["typescript.tsx"] = {eslint},
    typescriptreact = {eslint}
}
