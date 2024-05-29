local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
}

function M.config()
  require("dapui").setup()
  vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
end

return M
