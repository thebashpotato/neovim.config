local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
    {
      "p00f/clangd_extensions.nvim",
    },
  },
}

local function lsp_keymaps(buffer_number)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

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
  local lspconfig = require "lspconfig"
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
    virtual_text = { prefix = "" },
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
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    -- Here the server name must match the name of the lspconfig file,
    -- in order for the settings to be loaded
    local require_ok, settings = pcall(require, "user.plugins.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup()
    end

    lspconfig[server].setup(opts)
  end
end

return M
