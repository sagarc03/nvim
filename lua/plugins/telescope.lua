local opts = function()
	local telescopeConfig = require("telescope.config")
	local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

	table.insert(vimgrep_arguments, "--trim")

	return {
		defaults = {
			vimgrep_arguments = vimgrep_arguments,
			path_display = { "smart" },
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--type",
					"file",
					"--color",
					"never",
					"--glob",
					"--hidden",
					"--exclude",
					".git",
				},
			},
		},
	}
end
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = require("plugins.conf.telescope"),
		opts = opts,
	},
}
