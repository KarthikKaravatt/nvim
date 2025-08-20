vim.pack.add({
  "https://github.com/sschleemilch/slimline.nvim",
})
require("slimline").setup({
mode = {
      verbose = true,
    },
    style = "fg",
    components = {
      left = {
        "mode",
        "git",
        "recording",
      },
    },
})
