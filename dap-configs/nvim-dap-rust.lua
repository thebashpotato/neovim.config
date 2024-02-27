local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb"
}


dap.configurations.rust = {
	{
		name = "playground",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/target/debug/playground"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
