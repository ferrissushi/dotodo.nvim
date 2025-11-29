local M = {}

-- Main function to open new window.
---@param opts any The configuration of the current window to open.
---@return table The buffer and window of the current window.
M.create_todo_list_window = function(opts)
  opts = opts or {}
  opts.window_configuration = opts.window_configuration or {}
  opts.file_content = opts.file_content or {}

	local buffer = vim.api.nvim_create_buf(true, false)
	local win = vim.api.nvim_open_win(buffer, false, opts.window_configuration)
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, opts.file_content)

	vim.api.nvim_set_current_win(win)
  vim.opt_local.number = true
  vim.opt_local.relativenumber = false
  vim.opt_local.modifiable = false
  return buffer, win
end

return M
