-- The ConfigManager is used as a single source of truth the user configuration.
-- It is used through out the configuration to to set up themes, plugins and general neovim options
local ConfigManager

--- @class ConfigManager
---
--- @field private supported_themes Array: List of supported themes
--- @field private active_theme string: Name of the the user wants to use
ConfigManager = {
  supported_themes = {
    "onedark",
    "gruvbox",
    "ayu",
    "kanagawa",
    "oxocarbon",
    "dracula",
    "tokyonight",
    "doom-one",
    "bluloco",
  },
  active_theme = "oxocarbon",
}

--- Set the active theme
--- @param name string: Name of the theme the user wants to load, defaults to oxocarbon
---
--- Supported themes:
---  * onedark
---  * gruvbox
---  * ayu
---  * kanagawa
---  * oxocarbon
---  * dracula
---  * tokyonight
---  * doom-one
---  * bluloco
function ConfigManager:set_theme(name)
  local helper_functions = require "user.utils.helpers"
  if type(name) == "string" and helper_functions.is_in_array(name, self.supported_themes) then
    self.active_theme = name
  else
    vim.notify("Specified theme: " .. name .. " is not recognized.")
  end
end

--- Get's the active theme
--- @return string: Theme name
function ConfigManager:get_theme()
  return self.active_theme
end

return ConfigManager
