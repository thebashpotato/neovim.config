local M = {
  "neovim/nvim-lspconfig", -- Still needed for the default server configs
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/lazydev.nvim", -- neodev is deprecated, lazydev is the replacement
      ft = "lua",
      opts = {},
    },
    {
      "p00f/clangd_extensions.nvim",
    },
  },
}

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

function M.config()
  local icons = require "user.utils.icons"
  local config = require "user.managers.config_man"
  local x = vim.diagnostic.severity

  local servers = {}
  for lsp_config, _ in pairs(config:get_lsp_configs()) do
    table.insert(servers, lsp_config)
  end

  local default_diagnostic_config = {
    signs = {
      text = {
        [x.ERROR] = icons.diagnostics.BoldError,
        [x.WARN] = icons.diagnostics.BoldWarning,
        [x.INFO] = icons.diagnostics.BoldInformation,
        [x.HINT] = icons.diagnostics.BoldHint,
      },
    },
    virtual_text = { prefix = "" },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(default_diagnostic_config)

  -- These handlers are now configured differently in 0.11+
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  -- LspAttach autocmd replaces on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, opts)
    end,
  })

  -- Set default capabilities for all servers
  vim.lsp.config("*", {
    capabilities = M.common_capabilities(),
  })

  -- Configure each server
  for _, server in pairs(servers) do
    local opts = {}

    -- Load server-specific settings if they exist
    local require_ok, settings = pcall(require, "user.plugins.lspsettings." .. server)
    if require_ok then
      opts = settings
    end

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  end
end

return M
