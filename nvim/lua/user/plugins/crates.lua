local M = {
  "saecki/crates.nvim",
  tag = "stable",
}

function M.config()
  require("crates").setup()
end

return M
