-- This module handles dynamically loading themes.

local M = {}

-- Loads what ever theme the user wants from this directory
-- `my.plugins.lua`
-- 
-- Supported theme modules:
--  * my.configure.theme.onedark
--  * my.configure.theme.gruvbox
--  * my.configure.theme.ayu
--
-- Returns: table - theme configuration
function M.setup()
  return require('my.configure.theme.ayu')
end

-- Returns the name of the theme.
-- Method is used in `my.configure.lualine.lua`
-- 
-- Supported theme names: 
--  * onedark
--  * gruvbox
--  * ayu
--
-- Returns: string - name of the theme
function M.name()
  return 'ayu'
end

return M
