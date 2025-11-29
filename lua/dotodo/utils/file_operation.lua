local M = {}

local configuration = require("dotodo.utils.configuration")
local default_root_dir = configuration.configuration.default_configuration.root_dir

---A function to read the current TODO.md file in the root of the project.
---@param opts any
M.read_file = function(opts)
	opts = opts or {}

	local todo_file_path = nil

	for _, root_dir in ipairs(default_root_dir) do
		if todo_file_path ~= nil then
			break
		end

		local current_file_path = vim.fs.root(0, root_dir)

		-- TODO: Later I should be able to change the TODO file name that I'm searchingo for....
		-- I should be able to let the user change it...
		local current_doto_file_path = vim.fs.find({
			"TODO.md", "todo.md", "TODO.txt", "todo.txt",
		}, { path = current_file_path, limit = 1, upward = true, type = "file" })

		local todo_file = current_doto_file_path[1]

		if todo_file ~= nil then
			todo_file_path = todo_file
		end
	end

	-- Let's open the file...

	local file_content = vim.uv.fs_open("todo_file_path", "r", 438, nil)
end

M.read_file()
return M
