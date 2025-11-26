local M = {
  "EdenEast/nightfox.nvim",
}

function M.config()
  require("nightfox").setup {
    options = {
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
    },
  }

  -- vim.cmd("colorscheme nightfox")
  -- vim.cmd("colorscheme dayfox")
  -- vim.cmd("colorscheme dawnfox")
  -- vim.cmd("colorscheme duskfox")
  -- vim.cmd("colorscheme nordfox")
  -- vim.cmd("colorscheme terafox")
  vim.cmd "colorscheme carbonfox"
end

return M
