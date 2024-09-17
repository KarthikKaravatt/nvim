local dap = require("dap")
vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<Leader>dc', dap.continue, {})
vim.keymap.set("n", "<Leader>di", dap.step_into)
vim.keymap.set("n", "<Leader>dv", dap.step_over)
vim.keymap.set("n", "<Leader>do", dap.step_out)
vim.keymap.set("n", "<Leader>db", dap.step_back)
vim.keymap.set("n", "<Leader>dr", dap.restart)
-- Python Dap config
vim.keymap.set("n", "<Leader>d?", function()
  require("dapui").eval(nil, { enter = true })
end)
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
