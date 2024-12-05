local dap, dapui = require("dap"), require("dapui")
local function hover()
	require("dap.ui.widgets").hover()
end

-- Config dap keybinds
local wk = require("which-key")
wk.add({
	{ "<Leader>b", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
	{ "<Leader>n", dap.continue, desc = "Continue" },
	{ "<Leader>q", dap.stop, desc = "Stop" },
	{ "<Leader>dh", hover, desc = "hover" },
	{ "<F10>", dap.step_over, desc = "Step over" },
	{ "<F11>", dap.step_into, desc = "Step into" },
	{ "<F12>", dap.step_into, desc = "Step out" },
})

-- Config dap ui
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
