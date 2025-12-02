vim.api.nvim_create_user_command("TodoFileContent", function()
	require("dotodo").create_window({})
end, {})

-- TODO: Lanlotisant
vim.api.nvim_create_user_command("TodoList", function()
  require("dotodo").create_window({
    no_file = true
  })
end, {})
