return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup {
      mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
      overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
    }

    require("ayu").colorscheme()
    vim.o.background = "dark"
    vim.cmd "colorscheme ayu-dark"
  end,
}
