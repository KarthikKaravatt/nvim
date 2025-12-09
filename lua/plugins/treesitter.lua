vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
})

local ts_parsers = {
  "wgsl",
  "bash",
  "c",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "python",
  "sql",
  "toml",
  "tsx",
  "typescript",
  "typst",
  "vim",
  "yaml",
  "zig",
}

local nts = require("nvim-treesitter")

nts.install(ts_parsers)

vim.api.nvim_create_autocmd('PackChanged', { callback = function() nts.update() end })
