local M = {
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
    {
      "folke/neodev.nvim",
    },
  },
}

function M.config()
  require("dapui").setup()
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
end

return M
