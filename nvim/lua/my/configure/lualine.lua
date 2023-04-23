return {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup({
      options = {
        theme = require('my.configure.theme').name(),
        component_separators = '|',
      },
      sections = {
        lualine_a = {
          {
            'mode',
            right_padding = 2,
          },
        },

        lualine_b = { 'branch', 'diff', 'filename', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'encoding', 'fileformat', 'filetype', 'progress' },
        lualine_z = {
          {
            'location',
            left_padding = 2,
          },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
