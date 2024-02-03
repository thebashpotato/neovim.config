local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
}

function M.config()
  require("mason").setup()
  require("mason-null-ls").setup {
    ensure_installed = { "stylua" },
  }
end

return M
