local M = {}

local configuration = require("dotodo.utils.configuration")
local default_root_dir = configuration.configuration.default_configuration.root_dir


---A function to read the current TODO.md file in the root of the project.
---@param opts any
M.read_file = function(opts)
  opts = opts or {}

  for _, root_dir in ipairs(default_root_dir) do
    local file_path = vim.fs.root(0, root_dir)
    print(file_path)
  end
end


return M
