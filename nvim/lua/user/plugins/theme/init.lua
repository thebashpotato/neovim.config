-- This module handles dynamically loading themes.

local M = {}

-- Loads what ever theme the user wants from this directory `my.plugins.lua`
--
-- Supported themes by name:
--  * onedark
--  * gruvbox
--  * ayu
--  * kanagawa
--  * oxocarbon
--  * dracula
--  * tokyonight
--
-- Returns: table - theme configuration
function M.setup()
  return require "user.plugins.theme.oxocarbon"
end

-- Returns the name of the theme.
-- Method is used in `my.configure.lualine.lua`
--
-- Supported theme names:
--  * onedark
--  * gruvbox
--  * ayu
--  * auto -- use this for kanagawa theme
--  * oxocarbon
--  * dracula-nvim
--  * tokyonight
--
-- Returns: string - name of the theme
function M.name()
  return "oxocarbon"
end

return M
