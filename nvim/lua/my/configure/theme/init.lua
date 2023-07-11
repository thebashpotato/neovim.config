-- This module handles dynamically loading themes.

local M = {}

-- Loads what ever theme the user wants from this directory `my.plugins.lua`
--
-- Supported theme modules:
--  * my.configure.theme.onedark
--  * my.configure.theme.gruvbox
--  * my.configure.theme.ayu
--  * my.configure.theme.kanagawa
--
-- Returns: table - theme configuration
function M.setup()
  return require('my.configure.theme.kanagawa')
end

-- Returns the name of the theme.
-- Method is used in `my.configure.lualine.lua`
--
-- Supported theme names:
--  * onedark
--  * gruvbox
--  * ayu
--  * auto
--
-- Returns: string - name of the theme
function M.name()
  return 'auto'
end

return M
