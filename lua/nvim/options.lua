--[[
This file contains the global options.
--]]
local options = {
  g = {
    -- Leader settings
    mapleader = " ",    -- Make sure to set `mapleader` before lazy so your mappings are correct
    maplocalleader = " ", -- Make sure to set `mapleader` before lazy so your mappings are correct
    -- Python provider
    python3_host_prog = vim.env.HOME .. "/.config/nvim/.venv/bin/python",
    -- Plugin config for poet-v added here as its need before anything loads

    -- (Ordered) list of dependency managers to be used when attempting to activate a venv (or switch between existing ones).
    poetv_executables = { "poetry" },
    -- If set to 1 poet-v will attempt to automatically activate a venv (or switch between existing ones) when entering a python window.
    poetv_auto_activate = 1,
    -- If set to 1 poet-v will set the $VIRTUAL_ENV and $PATH environment variables when a venv gets activated.
    poetv_set_environment = 1,
  },
  opt = {
    -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
    breakindent = true,
    -- Copy the structure of the existing lines indent when autoindenting a new line.
    copyindent = true,
    -- When changing the indent of the current line, preserve as much of the indent structure as possible.
    preserveindent = true,
    -- Do smart autoindenting when starting a new line.
    smartindent = true,
    clipboard = "unnamedplus",
    completeopt = { "menuone", "noselect" },
    cursorline = true,
    expandtab = true,
    fileencoding = "utf-8",
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    foldcolumn = "1",
    history = 100,
    ignorecase = true,
    infercase = true,
    laststatus = 3,
    linebreak = true,
    mouse = "",
    number = true,
    pumheight = 10,
    relativenumber = false,
    scrolloff = 8,
    shiftwidth = 2,
    showmode = false,
    showtabline = 1,
    sidescrolloff = 8,
    signcolumn = "no",
    smartcase = true,
    splitbelow = true,
    splitright = true,
    splitkeep = "screen",
    tabstop = 2,
    termguicolors = true,
    timeoutlen = 500,
    undofile = true,
    updatetime = 300,
    virtualedit = "block",
    wrap = false,
  },
}

if vim.g.neovide then
  options["g"]["gui_font_default_size"] = 24
  options["g"]["gui_font_size"] = 24
  options["g"]["gui_font_face"] = "JetBrains Mono"
  options["g"]["neovide_refresh_rate"] = 144
  options["g"]["neovide_profiler"] = false
  options["g"]["neovide_cursor_vfx_mode"] = "torpedo"
  options["g"]["neovide_input_macos_alt_is_meta"] = true
  options["g"]["neovide_hide_mouse_when_typing"] = true
  options["opt"]["guifont"] = string.format("%s:h%s", "JetBrains Mono", "24")
end

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
