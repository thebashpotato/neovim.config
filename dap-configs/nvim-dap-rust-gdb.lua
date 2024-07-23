local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "/usr/bin/gdb",
  args = { "-i", "dap" }
}

dap.configurations.rust = {
  {
    name = "Launch <name>",
    type = "gdb",
    request = "launch",
    program = function()
			return vim.fn.getcwd() .. "/target/debug/<executable>"
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
