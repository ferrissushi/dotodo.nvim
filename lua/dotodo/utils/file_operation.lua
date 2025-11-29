local M = {}

local configuration = require("dotodo.utils.configuration")
local default_root_dir = configuration.configuration.default_configuration.root_dir

---A function to find the TODO.md file in the root of the project.
---@return string
local find_file = function()
	local todo_file_path = nil

	for _, root_dir in ipairs(default_root_dir) do
		if todo_file_path ~= nil then
			break
		end

		local current_file_path = vim.fs.root(0, root_dir)

		local current_doto_file_path = vim.fs.find({
			"TODO.md",
			"todo.md",
			"TODO.txt",
			"todo.txt",
		}, { path = current_file_path, limit = 1, upward = true, type = "file" })

		todo_file_path = current_doto_file_path[1]
	end
	return todo_file_path
end

---A function to read the current TODO.md file in the root of the project.
---@param opts any
M.read_file = function(opts)
	opts = opts or {}

	local todo_file_path = find_file()

	-- Let's open the file...
	local file_content_bufnr = vim.uv.fs_open(todo_file_path, "r", 438, nil)

	local file_content = vim.uv.fs_read(file_content_bufnr, vim.uv.fs_stat(todo_file_path).size, 0)

	vim.uv.fs_close(file_content_bufnr)
  return file_content
end

return M
