local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local servers = {
    "lua_ls",
    "cssls",
    "tailwindcss",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "marksman",
    "rust_analyzer",
    "clangd",
    "cmake",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
