vim.diagnostic.config({
  -- virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.keymap.set("n", "<leader>lf",
  function()
    vim.lsp.buf.format()
    vim.notify("Formated code")
  end
)
vim.keymap.set("n", "<leader>li",
  function()
    vim.lsp.buf.implementation()
  end
)
vim.keymap.set("n", "<leader>ld",
  function()
    vim.lsp.buf.definition()
  end
)
vim.keymap.set("n", "<leader>cn",
  function()
    vim.lsp.buf.rename()
  end
)
vim.keymap.set("n", "<leader>ca",
  function()
    vim.lsp.buf.code_action();
  end
)


local lsp_active = true

local lsp_active = true

vim.keymap.set('n', '<leader>td', function()
  local new_status = not vim.diagnostic.is_enabled()
  vim.diagnostic.enable(new_status)
  if new_status then
    vim.notify("Diagnostics enabled")
  else
    vim.notify("Diagnostics disabled")
  end
end)
