-- This small plugin enables loading per-project debugging configurations.
-- Simply place a '.nvim-dap.lua' in the root of your project which contains
-- the configuration.
local M = {
  "ldelossa/nvim-dap-projects",
  event = "VeryLazy",
}

function M.config()
  require("nvim-dap-projects").search_project_config()
end

return M
