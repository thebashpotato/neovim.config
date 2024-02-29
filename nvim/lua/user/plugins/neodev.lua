local M = {
  "folke/neodev.nvim",
}

function M.config()
  require("neodev").setup {
    library = { plugins = { "nvim-dap-ui" }, types = true },
  }
end

return M
