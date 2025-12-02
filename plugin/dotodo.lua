vim.api.nvim_create_user_command("TodoTodoFile", function()
	require("dotodo").create_window({})
end, {})

vim.api.nvim_create_user_command("TodoCurrentFile", function()
  require("dotodo").create_window({
    no_file = true
  })
end, {})
