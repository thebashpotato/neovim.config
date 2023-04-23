-- This module handles dynamically loading themes.

local M = {}

-- Loads what ever theme the user wants. This method must be called in
-- `my.plugins.lua`
function M.setup()
  return require('my.configure.theme.gruvbox')
end

-- Returns the name of the theme.
-- Method is used in `my.configure.lualine.lua`
function M.name()
  return 'gruvbox'
end

return M
