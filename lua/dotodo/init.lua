local M = {}

local window = require("dotodo.ui.window")
local configuration = require("dotodo.utils.configuration")
local default_configuration = configuration.configuration.default_configuration
local default_window_configuration = default_configuration.window_configuration

-- TODO: Change the type of the opts

--- A function to create the main window
--- @param opts any The configuration of the current window to open.
M.create_window = function(opts)
  opts = opts or {}
  opts.window_configuration = opts.window_configuration or default_window_configuration
	window.create_todo_list_window({
		window_configuration = opts.window_configuration,
	})
end

return M
