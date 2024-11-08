local dap = require("dap")
vim.keymap.set('n', '<Leader>dt', require('dap').toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>dc', require('dap').continue, { desc = 'Continue' })
vim.keymap.set('n', '<Leader>di', require('dap').step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<Leader>dv', require('dap').step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<Leader>do', require('dap').step_out, { desc = 'Step Out' })
vim.keymap.set('n', '<Leader>db', require('dap').step_back, { desc = 'Step Back' })
vim.keymap.set('n', '<Leader>dr', require('dap').restart, { desc = 'Restart' })
vim.keymap.set('n', '<Leader>d?', function()
  require('dapui').eval(nil, { enter = true })
end, { desc = 'Evaluate Expression' })
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. 'python') == 1 then
        return cwd .. 'python'
      elseif vim.fn.executable(cwd .. 'python') == 1 then
        return cwd .. 'python'
      else
        return 'python'
      end
    end,
  },
}

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch", -- either "launch" or "attach"
		name = "Launch Main Scene",
		-- specific to gdscript
		project = "${workspaceFolder}",
	},
}
