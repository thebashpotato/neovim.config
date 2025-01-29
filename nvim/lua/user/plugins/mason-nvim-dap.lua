-- This plugin only installs the appropriate debug adapter protocol interface,
-- however it does not install the debug server itself, nor does any nvim plugin.
-- It is not the job of an editor plugin to reinvent package management. Each debug server
-- must be installed on each machine

local M = {
  "jay-babu/mason-nvim-dap.nvim",
}

function M.config()
  local config = require "user.managers.config_man"

  require("mason-nvim-dap").setup {
    ensure_installed = config:get_debug_adapters(),
    automatic_installation = true,
  }
end

return M
