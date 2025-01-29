local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local config = require "user.managers.config_man"
  local servers = {}

  for lsp_config, install_server in pairs(config:get_lsp_configs()) do
    if install_server then
      table.insert(servers, lsp_config)
    end
  end

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
end

return M
