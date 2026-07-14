-- Enable broad snippet capability
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('neocmake', {
  capabilities = capabilities,
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { ".neocmake.toml", ".git", "build", "cmake" },
})

vim.lsp.enable('neocmake')
