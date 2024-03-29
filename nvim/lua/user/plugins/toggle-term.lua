local M = {
  "akinsho/toggleterm.nvim",
  lazy = false,
  version = "*",
}

function M.config()
  local toggleterm = require "toggleterm"
  toggleterm.setup {
    size = 15,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = -20,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float", -- vertical, horizontal, tab, float
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  }
end

return M
