local M = {
  "uloco/bluloco.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
}

function M.config()
  require("bluloco").setup {
    style = "auto", -- "auto" | "dark" | "light"
    transparent = false,
    italics = true,
    terminal = vim.fn.has "gui_running" == 1, -- bluoco colors are enabled in gui terminals per default.
    guicursor = true,
  }

  vim.opt.termguicolors = true
  vim.cmd "colorscheme bluloco"
end

return M
