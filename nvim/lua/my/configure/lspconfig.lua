return {
  'neovim/nvim-lspconfig',
  requires = {
    'jose-elias-alvarez/null-ls.nvim',
    'LunarVim/peek.lua',
    'williamboman/mason.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/cmp-nvim-lsp',
    -- having this one installed just makes neovim api docs available
    -- via LSP, don't need to actually do anything with it
    'folke/neodev.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-tool-installer').setup({
      auto_update = true,
      ensure_installed = require('my.lsp.filetypes').mason_packages,
    })
    require('my.lsp').setup()
  end,
}
