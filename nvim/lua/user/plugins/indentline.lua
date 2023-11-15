local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
}

function M.config()
  require("ibl").setup()
end

return M
