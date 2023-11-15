-- Add all plugin specs to this giant table, it will be loaded
-- in the user.manager module by lazy.vim.
return {
  -- Neovim lua libraries that all plugins require,
  -- We don't actually interact with these plugins.
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  -- Editing enhancements and tools
  require("user.plugins.autopairs"),
  require("user.plugins.comment"),
  require("user.plugins.markdown-preview"),
  require("user.plugins.bufdelete"),

  -- Completion and Snippets
  require("user.plugins.completion"),
  require("user.plugins.schemastore"),

  -- LSP and formatting
  require("user.plugins.mason"),
  require("user.plugins.lspconfig"),

  -- Debugging
  require("user.plugins.dap"),
  require("user.plugins.dapui"),

  -- Ui + Utils
  "nvim-tree/nvim-web-devicons",
  require("user.plugins.theme").setup(),
  require("user.plugins.alpha"),
  require("user.plugins.lualine"),
  require("user.plugins.bufferline"),
  require("user.plugins.nvim-tree"),
  require("user.plugins.which-key"),
  require("user.plugins.toggle-term"),
  require("user.plugins.telescope"),
  require("user.plugins.project"),
  require("user.plugins.nvim-colorizer"),

  -- Version control
  require("user.plugins.neogit"),
  require("user.plugins.diffview"),
  require("user.plugins.gitsigns"),

  -- Syntax Highlighting stuff
  require("user.plugins.treesitter"),
  require("user.plugins.navic"),
  require("user.plugins.breadcrumbs"),
  require("user.plugins.indentline"),
  require("user.plugins.illuminate"),
}

