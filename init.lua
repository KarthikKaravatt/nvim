--config
require("config.set")
require("config.lsp.setup")

--lsp
require('config.lsp.lua_ls')
require('config.lsp.zls')
require('config.lsp.rust_analyzer')

--plugins
require("plugins.treesitter")
require("plugins.nvim-oil")
require("plugins.github-theme-nvim")
require("plugins.status-line")
require("plugins.completion")
require("plugins.dashboard")
require("plugins.fzf")
require("plugins.ui-nvim")

