local M = {}

---Function to trimleft the string
---@param s string
---@return string
M.ltrim = function(s)
  return s:match("^%s*(.-)$")
end

---function to split a file content by row
---@param content string
---@return string[]
M.split_file_content = function(content)
  local lines = {}
	for line in content:gmatch("([^\n]*)\n?") do
		table.insert(lines, line)
	end

  return lines
end

return M
