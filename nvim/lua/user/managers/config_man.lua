---@diagnostic disable: duplicate-doc-field, duplicate-set-field

--- The ConfigManager is used as a single source of truth the user configuration.
--- It is used through out the configuration to to set up themes, plugins and general neovim options
---
--- @class ConfigManager
---
--- @field private active_theme string: Name of the the user wants to use
--- @field private toggle_term_direction string: Direction of toggle term plugin, defaults to horizontal
--- @field private supported_themes string[]: List of supported themes
--- @field private lsp_configs table<string, boolean>: Language Service Protocol configs loaded by lspconfig
--- @field private debug_adapters string[]: Debug Adapter Protocol
--- @field private non_lsp_sources string[]: Non lsp sources, which are formatters, linters etc..
--- @field private tree_sitter_parser string[]: Tree sitter language parsers for better and modern syntax highlighting
local M = {
  active_theme = "nightfox",
  toggle_term_direction = "horizontal",
  supported_themes = {
    "onedark",
    "gruvbox",
    "ayu",
    "kanagawa",
    "dracula",
    "tokyonight",
    "doom-one",
    "bluloco",
    "lackluster",
    "catpuccin",
    "noctishc",
    "sonokai",
    "nightfox",
  },
  lsp_configs = {},
  debug_adapters = {},
  non_lsp_sources = {},
  tree_sitter_parsers = {},
}

--- Set the active theme
--- @param name string: Name of the theme the user wants to load, defaults to nightfox
---
--- Supported themes:
---  * onedark
---  * gruvbox
---  * ayu
---  * kanagawa
---  * dracula
---  * tokyonight
---  * doom-one
---  * bluloco
---  * lackluster
---  * catpuccin
---  * noctishc
---  * sonokai
function M:set_theme(name)
  local helper_func = require "user.utils.helpers"
  if type(name) == "string" and helper_func.is_in_array(name, self.supported_themes) then
    self.active_theme = name
  else
    vim.notify("Specified theme: " .. name .. " is not recognized.")
  end
end

--- Gets the active theme
--- @return string: Theme name
function M:get_theme()
  return self.active_theme
end

--- Set the direction of the toggle terminal
--- @param direction string: Accepted values are: vertical, horizontal, tab, float
function M:set_toggle_term_direction(direction)
  if type(direction) == "string" then
    self.toggle_term_direction = direction
  end
end

--- Gets the toggle term direction value
--- @return string
function M:get_toggle_term_direction()
  return self.toggle_term_direction
end

--- Add a Language Service Protocol configuration, and specify whether Mason should install the corresponding server.
--- @param lsp_config string: Name of the language server protocol config (nvim lspconfig uses this to set up a configuration for the language)
--- @param install_server boolean: Rely on Mason to act as the package manager and install the actual server, (If not, you will need to use your systems package manager to install the actual server) [e.g] paru -S cmake-language-server
function M:add_lsp_config(lsp_config, install_server)
  if type(lsp_config) == "string" and type(install_server) == "boolean" then
    if self.lsp_configs[lsp_config] == nil then
      self.lsp_configs[lsp_config] = install_server
    end
  end
end

--- Gets the array of all lsp servers the user has added
--- @return table<string, boolean>
function M:get_lsp_configs()
  return self.lsp_configs
end

--- Add's a Debug Adapter Protocol. (Note that Mason only installs the interface, you must install the actual debug server yourself) e.g pacman -S codelldb
--- @param adapter string: Name of the dap
function M:add_debug_adapter(adapter)
  local helper_func = require "user.utils.helpers"
  if type(adapter) == "string" and not helper_func.is_in_array(adapter, self.debug_adapters) then
    table.insert(self.debug_adapters, adapter)
  end
end

--- Gets the array of all Debug Adapter Protocol servers
--- @return string[]
function M:get_debug_adapters()
  return self.debug_adapters
end

--- Non lsp sources, which are formatters, linters etc.. Basically anything supported by null-ls/none-ls
--- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
--- @param source string: Name of the source
function M:add_non_lsp_source(source)
  local helper_func = require "user.utils.helpers"
  if type(source) == "string" and not helper_func.is_in_array(source, self.non_lsp_sources) then
    table.insert(self.non_lsp_sources, source)
  end
end

--- Get the array of non lsp sources
--- @return string[]
function M:get_non_lsp_sources()
  return self.non_lsp_sources
end

--- Add a treesitter language parser
--- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
--- @param parser string: Supported Parser
function M:add_treesitter_parser(parser)
  local helper_func = require "user.utils.helpers"
  if type(parser) == "string" and not helper_func.is_in_array(parser, self.tree_sitter_parsers) then
    table.insert(self.tree_sitter_parsers, parser)
  end
end

--- Get the array of treesitter parsers
--- @return string[]
function M:get_treesitter_parsers()
  return self.tree_sitter_parsers
end

return M
