local M = {}

--- Main function to open new window.
---@param opts any The configuration of the current window to open.
local create_todo_list_window = function(opts)
	local buffer = vim.api.nvim_create_buf(true, false)
	local win = vim.api.nvim_open_win(buffer, false, opts.window_configuration)
	vim.api.nvim_set_current_win(win)
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.modifiable = false
end

-- Here I just tried to open a new basic plugnis
local configuration = {
	relative = "editor",
	row = math.floor(math.floor(vim.o.lines / 2) / 2),
	col = math.floor(math.floor(vim.o.columns / 2) / 2),
	width = math.floor(vim.o.columns / 2),
	height = math.floor(vim.o.lines / 2),
	border = "rounded",
}

create_todo_list_window({
	window_configuration = configuration,
})

return M
