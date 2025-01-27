--- Helper functions
local M = {}

--- Linear search, checks if the value is in the array
--- @param value any:
--- @param array any:
--- @return boolean
function M.is_in_array(value, array)
  for _, v in ipairs(array) do
    if v == value then
      return true
    end
  end

  return false
end

return M
