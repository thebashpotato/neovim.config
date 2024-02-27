local M = {
  "ldelossa/nvim-dap-projects",
}

function M.config()
  require("nvim-dap-projects").search_project_config()
end

return M
