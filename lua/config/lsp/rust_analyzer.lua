vim.lsp.config['rust_analyzer'] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  capabilities = {
    experimental = {
      serverStatusNotification = true
    }
  },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
vim.lsp.enable("rust_analyzer");
