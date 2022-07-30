if not vim.g.neovide then
	return
end

vim.g.gui_font_default_size = 23
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMono Nerd Font Mono"
vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

vim.g.neovide_refresh_rate = 144
vim.g.neovide_profiler = false
vim.g.neovide_cursor_vfx_mode = "torpedo"
