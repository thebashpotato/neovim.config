local M = {
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true, -- or `opts = {}`
}

function M.config()
  require("headlines").setup {}
end

return M
