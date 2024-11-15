require("config.options")
require("config.autocmd")
require("config.lazy")
require("config.mappings")

-- vim.filetype.add({
-- 	extension = {
-- 		gotmpl = "gotmpl",
-- 	},
-- })
--
-- for _, source in ipairs({
-- 	"nvim.options",
-- 	"nvim.lazy",
-- 	"nvim.autocmd",
-- 	"nvim.mappings",
-- }) do
-- 	local status_ok, fault = pcall(require, source)
-- 	if not status_ok then
-- 		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
-- 	end
-- end
