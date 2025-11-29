local M = {}

M.configuration = {
	default_configuration = {
		window_configuration = {
			relative = "editor",
			row = math.floor(math.floor(vim.o.lines / 2) / 2),
			col = math.floor(math.floor(vim.o.columns / 2) / 2),
			width = math.floor(vim.o.columns / 2),
			height = math.floor(vim.o.lines / 2),
			border = "single",
			style = "minimal",
			title = "TODOs",
			title_pos = "left",
		},
	},
}
return M
