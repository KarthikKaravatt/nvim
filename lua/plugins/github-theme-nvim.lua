vim.pack.add({
 "https://github.com/projekt0n/github-nvim-theme"
})
require('github-theme').setup({
   groups = {
    all = {
      Normal = { bg = "#000000" },
      NormalNC = { bg = "#000000" },
      Pmenu      = { bg = "#000000" },
      PmenuSel   = { bg = "#000000" }, -- Or a different color for selection
      PmenuSbar  = { bg = "#000000" },
      PmenuThumb = { bg = "#000000" },
    },
  },
})

vim.cmd('colorscheme github_dark')


