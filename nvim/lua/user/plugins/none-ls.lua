local M = {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local null_ls = require "null-ls"
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
