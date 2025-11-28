local M = {}

--- Main function to open new window.
---@param opts any The configuration of the current window to open.
M.open_todo_list = function(opts)
  local buffer = vim.api.nvim_create_buf(true, false)
  local win = vim.api.nvim_open_win(buffer, false, opts.window_configuration)
  vim.api.nvim_set_current_win(win)
end


local configuration = {
  relative = "editor",
  row = math.floor(math.floor(vim.o.lines / 2) /2),
  col = math.floor(math.floor(vim.o.columns / 2) /2),
  width = math.floor(vim.o.columns /2),
  height = math.floor(vim.o.lines / 2),
  border = "rounded"
}


local colorscheme =  require("rose-pine")
print(colorscheme)

M.open_todo_list({
  window_configuration = configuration
})



return M
