local M = {
  "akinsho/bufferline.nvim",
  lazy = false,
  priority = 1000,
  dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
  local icons = require "user.utils.icons"

  require("bufferline").setup {
    options = {
      themable = true,
      mode = "tabs",
      tab_size = 20,
      buffer_close_icon = icons.diagnostics.Error,
      modified_icon = icons.ui.Circle,
      close_icon = icons.diagnostics.Error,
      close_command = "Bdelete %d",
      color_icons = true,
      right_mouse_command = "Bdelete! %d",
      left_trunc_marker = "",
      right_trunc_marker = "",
      offsets = { { filetype = "NvimTree", text = "📁", text_align = "center" } },
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_buffer_icons = true,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match "error" and icons.diagnostics.Error or icons.diagnostics.Warning
        return " " .. icon .. count
      end,

      -- NOTE this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number, buf_numbers)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
          return true
        end
        -- filter out by buffer name
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
          return true
        end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
          return true
        end
        -- filter out by it's index number in list (don't show first buffer)
        if buf_numbers[1] ~= buf_number then
          return true
        end
      end,
      always_show_bufferline = true,
    },
  }
end

return M
