return {
  'ellisonleao/gruvbox.nvim',
  config = function()
    require('gruvbox').setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        operators = true,
        comments = true,
        folds = true,
      },
      strikethrough = true,
      invert_selection = true,
      invert_signs = true,
      invert_tabline = true,
      invert_intend_guides = false,
      inverse = false, -- invert background for search, diffs, statuslines and errors
      contrast = 'hard', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = true,
      transparent_mode = true,
    })
    vim.o.background = 'dark'
    vim.cmd('colorscheme gruvbox')
  end,
}
