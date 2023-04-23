return {
  'kyazdani42/nvim-tree.lua',
  cmd = {
    'NvimTreeClipboard',
    'NvimTreeClose',
    'NvimTreeFindFile',
    'NvimFreeFindFileToggle',
    'NvimTreeFocus',
    'NvimTreeOpen',
    'NvimTreeRefresh',
    'NvimTreeResize',
    'NvimTreeToggle',
  },
  config = function()
    require('nvim-tree').setup({
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = false,
        side = 'left',
        width = 35,
      },
      filesystem_watchers = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = 'none',
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })
  end,
}
