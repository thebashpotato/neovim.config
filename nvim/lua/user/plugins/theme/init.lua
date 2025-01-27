--- Loads the theme specified in ConfigMangaer
local M = {}

function M.setup()
  local config = require "user.managers.config_man"
  local theme = "user.plugins.theme." .. config:get_theme()
  return require(theme)
end

return M
