--[[
This file contains the global options.
--]]
local options = {
	g = {
		mapleader = " ",
		maplocalleader = "\\",
		-- Leader settings
		-- Python provider
		python3_host_prog = vim.env.HOME .. "/.config/nvim/.venv/bin/python",
		-- Plugin config for poet-v added here as its need before anything loads

		-- (Ordered) list of dependency managers to be used when attempting to activate a venv (or switch between existing ones).
		poetv_executables = { "poetry" },
		-- If set to 1 poet-v will attempt to automatically activate a venv (or switch between existing ones) when entering a python window.
		poetv_auto_activate = 1,
		-- If set to 1 poet-v will set the $VIRTUAL_ENV and $PATH environment variables when a venv gets activated.
		poetv_set_environment = 1,
		loaded_ruby_provider = 0,
		loaded_perl_provider = 0,
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
		foldenable = false,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
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
	options["g"]["neovide_refresh_rate"] = 144
	options["g"]["neovide_profiler"] = false
	options["g"]["neovide_cursor_vfx_mode"] = "torpedo"
	options["g"]["neovide_input_macos_option_key_is_meta"] = "only_left"
	options["g"]["neovide_hide_mouse_when_typing"] = true
	options["opt"]["guifont"] = string.format("%s:h%s", "JetBrainsMono Nerd Font", "21")

	options["g"]["neovide_confirm_quit"] = true

	options["g"]["neovide_floating_shadow"] = true
	options["g"]["neovide_floating_z_height"] = 10
	options["g"]["neovide_light_angle_degrees"] = 45
	options["g"]["neovide_light_radius"] = 2
end

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end
