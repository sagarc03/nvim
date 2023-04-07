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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.opt.termguicolors = true -- True color support

local opt = vim.opt

opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.expandtab = true -- Use spaces instead of tabs
opt.number = true -- Print line number
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.signcolumn = "no" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wrap = false -- Disable line wrap
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.completeopt = "menu,menuone,noselect"

vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.env.HOME .. "/.config/nvim/.venv/bin/python"

if vim.g.neovide then
	vim.g.gui_font_default_size = 23
	vim.g.gui_font_size = vim.g.gui_font_default_size
	vim.g.gui_font_face = "JetBrainsMono Nerd Font Mono"
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_profiler = false
	vim.g.neovide_cursor_vfx_mode = "torpedo"
end

vim.g.poetv_executables = { "poetry" }
vim.g.poetv_auto_activate = 1
vim.g.poetv_set_environment = 1

require("lazy").setup("plugins")
