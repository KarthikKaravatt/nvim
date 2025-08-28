vim.lsp.config['harper_ls'] =  {
  cmd = { "harper-ls", "--stdio" },
  filetypes = { "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua", "markdown", "nix", "python", "ruby", "rust", "swift", "toml", "typescript", "typescriptreact", "haskell", "cmake", "typst", "php", "dart", "clojure" },
  root_markers = { ".git" },
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/dict.txt"
    }
  },
}
vim.lsp.enable('harper_ls')
