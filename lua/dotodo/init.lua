local M = {}

-- So here I just tried to open a basic window...........
-- Let's import it...
local window = require("dotodo.ui.window")

-- Here I just tried to open a new basic plugnis

M.create_window = function()
	window.create_todo_list_window({
		window_configuration = configuration,
	})
end

return M
