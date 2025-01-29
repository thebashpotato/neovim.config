local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
}

function M.config()
  local config = require "user.managers.config_man"

  require("mason").setup()
  require("mason-null-ls").setup {
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
    automatic_installation = true,
    ensure_installed = config:get_non_lsp_sources(),
  }
end

return M
