local M = {
  "nvim-lualine/lualine.nvim",
}

function M.diagnostics()
  local icons = require "user.utils.icons"
  -- local buf_clients = vim.lsp.get_clients()

  local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
  if #buf_clients == 0 then
    return "" .. icons.diagnostics.BoldHint .. " LSP Inactive"
  end

  local buf_client_names = {}
  local client_name = ""

  for _, client in pairs(buf_clients) do
    if #buf_clients == 1 and client.name == "null-ls" then
      client_name = client.name
      break
    end

    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
      client_name = client.name
    end
  end

  return "" .. icons.ui.Circle .. client_name .. " Active"
end

function M.config()
  local icons = require "user.utils.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = {
      added = icons.git.LineAdded,
      modified = icons.git.LineModified,
      removed = icons.git.LineRemoved,
    },
  }

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "branch", icon = "" } },
      lualine_c = { diff },
      lualine_x = { "diagnostics", M.diagnostics },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
