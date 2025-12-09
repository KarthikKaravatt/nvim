vim.lsp.config["wgsl_analyzer"] = {
  cmd = { "wgsl-analyzer" },
  filetypes = { "wgsl" },
  root_markers = { ".git" },
  settings = { }
}
vim.lsp.enable('wgsl_analyzer')
