local M = {
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
}

function M.config()
  require("dapui").setup()
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
end

return M
