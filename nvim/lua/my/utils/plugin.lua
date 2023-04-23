-- Helper functions used by plugins

M = {}

--- Generates a button for alpha.nvim dashboard configuration.
-- @param label the text that will be displayed at this button
-- @param shortcut the shortcut key label text
-- @param hl_icon the highlight group of the label icon
-- @param hl_label the highlight group for the button label text
-- @return table options table that will be passed onto the alpha setup function
function M.generate_button(label, shortcut, hl_label, hl_icon)
  return {
    type = 'button',
    val = label,
    opts = {
      position = 'center',
      shortcut = shortcut,
      cursor = 5,
      width = 25,
      align_shortcut = 'right',
      hl_shortcut = 'AlphaKeyPrefix',
      hl = {
        { hl_icon, 1, 3 }, -- highlight the icon glyph
        { hl_label, 4, 15 }, -- highlight the part after the icon glyph
      },
    },
  }
end

return M
