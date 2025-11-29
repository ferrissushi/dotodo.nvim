local M = {}

-- So here I just tried to open a basic window...........
-- Let's import it...
local window = require("dotodo.ui.window")

-- Here I just tried to open a new basic plugnis
local configuration = {
	relative = "editor",
	row = math.floor(math.floor(vim.o.lines / 2) / 2),
	col = math.floor(math.floor(vim.o.columns / 2) / 2),
	width = math.floor(vim.o.columns / 2),
	height = math.floor(vim.o.lines / 2),
	border = "single",
	style = "minimal",
	title = "TODOs",
	title_pos = "left",
}

M.create_window = function()
	window.create_todo_list_window({
		window_configuration = configuration,
	})
end

return M
