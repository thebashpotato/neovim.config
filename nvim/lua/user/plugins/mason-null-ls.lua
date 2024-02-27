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
    automatic_installation = false,
    ignore_methods = {
      diagnostics = false,
      formatting = false,
      code_actions = false,
      completion = false,
      hover = false,
    },
    methods = {
      diagnostics = true,
      formatting = true,
      code_actions = true,
      completion = true,
      hover = true,
    },
    handlers = nil,
    ensure_installed = { "stylua", "prettier" },
  }
end

return M
