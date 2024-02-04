local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
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

  local diagnostics = function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then
      return "" .. icons.diagnostics.BoldHint .. " LSP Inactive"
    else
    end

    local buf_client_names = {}
    local copilot_active = false
    local client_name = ""
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      if client.name == "copilot" then
        copilot_active = true
      end
      client_name = client.name
    end

    if copilot_active then
      return "%#Copilot#" .. icons.git.Octoface .. "%*"
    end
    return "" .. icons.ui.Circle .. client_name .. " Active"
  end

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
      lualine_x = { "diagnostics", diagnostics },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
