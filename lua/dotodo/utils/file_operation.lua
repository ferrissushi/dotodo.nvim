local M = {}

local configuration = require("dotodo.utils.configuration")
local default_file_names = configuration.configuration.default_configuration.todo_file_names

local default_root_dir = configuration.configuration.default_configuration.root_dir

---This is a function to open a file.
---@param path string The path of the file to open
---@return integer|string
local open_file = function(path)
	if path == nil then
		return "Path not provided"
	end
	local file_content_bufnr = vim.uv.fs_open(path, "r", 438, nil)
	return file_content_bufnr
end

---Function to close an opened file
---@param file_content_bufnr any
local close_file = function(file_content_bufnr)
	vim.uv.fs_close(file_content_bufnr)
end

---A function to find the TODO.md file in the root of the project.
---@return string
local find_file = function(file_names)
  file_names = file_names or default_file_names
	local todo_file_path = nil
	for _, root_dir in ipairs(default_root_dir) do
		if todo_file_path ~= nil then
			break
		end
		local current_file_path = vim.fs.root(0, root_dir)
		local current_todo_file_path = vim.fs.find(file_names, { path = current_file_path, limit = 1, upward = true, type = "file" })
		todo_file_path = current_todo_file_path[1]
	end
	return todo_file_path
end

---A function to open any file
---@param path string
M.read_file_content = function(path)
	path = path or vim.uv.cwd()
	local file_content_bufnr = open_file(path)
	local file_content = vim.uv.fs_read(file_content_bufnr, vim.uv.fs_stat(path).size, 0)
	close_file(file_content_bufnr)
  return file_content
end

---A function to read the current TODO.md file in the root of the project.
---@param opts any
M.read_todo_file = function(opts)
	opts = opts or {}
	local todo_file_path = find_file()
	return M.read_file_content(todo_file_path)
end



----- Manual test ------

local path = vim.uv.cwd() .. "/lua/dotodo/init.lua"
local content = M.read_file_content(path)
print(content)

return M
