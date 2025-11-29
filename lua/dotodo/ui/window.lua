local M = {}

-- Main function to open new window.
---@param opts any The configuration of the current window to open.
M.create_todo_list_window = function(opts)
	local buffer = vim.api.nvim_create_buf(true, false)
	local win = vim.api.nvim_open_win(buffer, false, opts.window_configuration)
	vim.api.nvim_set_current_win(win)
  vim.opt_local.number = true
  vim.opt_local.relativenumber = false
  vim.opt_local.modifiable = false
end

return M
