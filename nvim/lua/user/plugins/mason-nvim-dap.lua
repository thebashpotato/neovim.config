-- This plugin only install the appropriate debug adapter protocol interface,
-- however it does not install the debug server itself, nor does any nvim plugin.
-- It is not the job of an editor plugin to reinvent package management. Each debug server
-- must be installed on each machine

local M = {
  "jay-babu/mason-nvim-dap.nvim",
}

function M.config()
  -- Ensure these debug servers are automatically
  -- installed.
  local debug_servers = {
    "codelldb", -- lldb
    "cppdbg", -- lldb
    "js",
    "python",
    "bash",
  }

  require("mason-nvim-dap").setup {
    ensure_installed = debug_servers,
    automatic_installation = true,
  }
end

return M
