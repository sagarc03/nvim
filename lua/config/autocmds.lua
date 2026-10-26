-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- snacks terminal windows use NormalFloat, which is lighter under gruvbox;
-- set a background a shade darker than the editor's Normal (#1d2021)
local function match_snacks_terminal_bg()
  vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "#171a1b" })
  vim.api.nvim_set_hl(0, "SnacksNormalNC", { bg = "#171a1b" })
end
match_snacks_terminal_bg()
vim.api.nvim_create_autocmd("ColorScheme", { callback = match_snacks_terminal_bg })
