return {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local plugin_utils = require('my.utils.plugin')
    local heading = {
      type = 'text',
      val = require('my.utils.banners')['pacman'],
      opts = {
        position = 'center',
        hl = 'Alphaheading',
      },
    }

    local buttons = {
      type = 'group',
      val = {
        plugin_utils.generate_button('  Find File', ' SPC ff ', 'AlphaButtonLabelText', 'WildMenu'),
        plugin_utils.generate_button('  Recents', ' SPC fh ', 'AlphaButtonLabelText', 'Boolean'),
        plugin_utils.generate_button('  Find Word', ' SPC fg ', 'AlphaButtonLabelText', 'String'),
      },
      opts = {
        position = 'center',
        spacing = 1,
      },
    }

    local loaded = {
      type = 'text',
      val = string.format(' Loaded %d plugins', vim.tbl_count(packer_plugins)),
      opts = {
        position = 'center',
        hl = 'AlphaLoaded',
      },
    }

    local footing = {
      type = 'text',
      val = '-Ghost In  The Shell-',
      opts = {
        position = 'center',
        hl = 'AlphaFooting',
      },
    }

    local layout = {
      { type = 'padding', val = 2 },
      heading,
      { type = 'padding', val = 2 },
      footing,
      { type = 'padding', val = 1 },
      buttons,
      { type = 'padding', val = 1 },
      loaded,
      { type = 'padding', val = 2 },
    }

    local config = {
      layout = layout,
      opts = { margin = 10 },
    }

    alpha.setup(config)
  end,
}
