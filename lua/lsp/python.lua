M = {}

local execute_cmd = function(cmd)
	local op = io.popen(cmd)
	local op_string = op:read("*a")
	op:close()
	return op_string
end

local file_exists = function(fname)
	local stat = vim.loop.fs_stat(fname)
	if stat and stat.type then
		return true
	else
		return false
	end
end

local find_poetry_virtual_env_folder = function()
	if file_exists("pyproject.toml") then
		local poetry_cmd = "poetry env info -p"
		return string.gsub(execute_cmd(poetry_cmd), "^%s*(.-)%s*$", "%1")
	else
		return ""
	end
end

M = {
	set_poetry_virtual_env = function()
		local folder = find_poetry_virtual_env_folder()
		if folder ~= "" then
			vim.env.PATH = folder .. "/bin:" .. vim.env.PATH
			vim.env.VIRTUAL_ENV = folder
		end
	end,
}

return M
