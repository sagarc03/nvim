local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[colorscheme deepwhite]])
-- vim.cmd([[colorscheme modus_operandi]]) -- modus_operandi, modus_vivendi
--vim.cmd([[colorscheme halfspace]])
--vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme tokyonight-storm]])
-- vim.cmd([[colorscheme catppuccin-macchiato]])
-- vim.cmd([[colorscheme kanagawa-wave]])
-- vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme kanagawa-lotus]])
