return {
  'glyh/oxocarbon.nvim',
  branch = 'lualine-support',
  config = function()
    vim.opt.background = 'dark' -- set this to dark or light
    vim.cmd.colorscheme('oxocarbon')
  end,
}
