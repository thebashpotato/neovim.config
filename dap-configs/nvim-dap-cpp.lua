local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch main application",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/build/app/app"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
