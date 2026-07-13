--config
require("config.set")
require("config.lsp.setup")

--LSP
require('config.lsp.lua_ls')
require('config.lsp.zls')
require('config.lsp.rust_analyzer')
require('config.lsp.harper')
require('config.lsp.wgsl')
require("config.lsp.clangd")
require("config.lsp.pyrefly")
require("config.lsp.ruff")
require("config.lsp.neocmakelsp")


--plugins
require("plugins.treesitter")
require("plugins.nvim-oil")
require("plugins.github-theme-nvim")
require("plugins.status-line")
require("plugins.completion")
require("plugins.dashboard")
require("plugins.fzf")
require("plugins.ui-nvim")
require("plugins.dropbar");
require("plugins.typescript-tools");
require("plugins.web-devicons");
