local M = {}
local utils = require("dotodo.utils.utils")

--TODO: Hello

-- Main function to open new window.
---@param opts any The configuration of the current window to open.
---@return table The buffer and window of the current window.
M.create_todo_list_window = function(opts)
	opts = opts or {}
	opts.window_configuration = opts.window_configuration or {}

  local lines = opts.file_content
	-- local lines = utils.split_file_content(opts.file_content)

	local buffer = vim.api.nvim_create_buf(true, false)
	local win = vim.api.nvim_open_win(buffer, false, opts.window_configuration)
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)

	vim.api.nvim_set_current_win(win)
	vim.opt_local.number = true
	vim.opt_local.relativenumber = false
	vim.opt_local.modifiable = false
	return buffer, win
end

return M
