local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap",
  name = "lldb"
}

dap.configurations.rust = {
	{
		name = "Launch <name>",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/target/debug/<executable>"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
