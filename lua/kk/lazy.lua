
-- Lazy.nvim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim...')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Configuration
local plugins = {


  -- Treesitter for syntax highlighting and parsing
  { 'nvim-treesitter/nvim-treesitter' },

  -- Rose Pine theme
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- Telescope for fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Oil file explorer
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Lualine for status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Other Plugins
  { 'Bekaboo/deadcolumn.nvim' },
  {
    'numToStr/Comment.nvim',
    opts = {}, -- Add configuration here if needed
  },
  { 'goolord/alpha-nvim' },
  {'m4xshen/autoclose.nvim'},
  { 'windwp/nvim-ts-autotag' },
  { 'mfussenegger/nvim-dap' },

  -- DAP UI
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' }
  },

  -- Which-key for keybinding hints
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Godot integration
  { "habamax/vim-godot", event = 'VimEnter' },

  -- LSP and completion
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'neovim/nvim-lspconfig'},
    opts = {},
  },

  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  -- Tailwind tools
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {} -- your configuration
  },
  {
    'razak17/tailwind-fold.nvim',
    opts= {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
  },
  -- Formating
  {'lukas-reineke/lsp-format.nvim'},
}

-- Load Plugins
require('lazy').setup(plugins)
