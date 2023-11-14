return {
  'glyh/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  branch = 'lualine-support',
  config = function()
    vim.opt.background = 'dark' -- set this to dark or light
    vim.cmd.colorscheme('oxocarbon')
  end,
}
