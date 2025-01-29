local M = {
  "akinsho/toggleterm.nvim",
  lazy = false,
  version = "*",
}

function M.config()
  local toggleterm = require "toggleterm"
  local config = require "user.managers.config_man"

  toggleterm.setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 20
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      else
        return 15
      end
    end,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = -20,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = config:get_toggle_term_direction(),
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
