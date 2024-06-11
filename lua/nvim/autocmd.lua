vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		local loaded, project_nvim = pcall(require, "project_nvim.project")
		if not loaded then
			vim.notify_once("Error: failed to load the project_nvim.project module")
			return
		end
		local project_dir, _ = project_nvim.get_project_root()
		if project_dir then
			local venv = project_dir .. "/.venv"
			if vim.fn.isdirectory(venv) ~= 0 then
				local ORIGINAL_PATH = vim.fn.getenv("PATH")
				vim.fn.setenv("PATH", venv .. "/bin" .. ":" .. ORIGINAL_PATH)
				vim.notify_once("Info: using virtualenv at " .. project_dir)
			end
		end
	end,
})
