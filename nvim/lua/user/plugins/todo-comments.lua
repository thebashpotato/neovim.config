local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- leave it empty to use the default settings
  },
}

function M.config()
  require("todo-comments").setup()
end

return M
