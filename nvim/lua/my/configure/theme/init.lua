-- This module handles dynamically loading themes.

local M = {}

-- Loads what ever theme the user wants from this directory
-- `my.plugins.lua`
-- Returns
--  my.configure.theme.onedark
--  my.configure.theme.gruvbox
function M.setup()
  return require('my.configure.theme.onedark')
end

-- Returns the name of the theme.
-- Method is used in `my.configure.lualine.lua`
--
-- Returns: gruvbox, onedark
function M.name()
  return 'onedark'
end

return M
