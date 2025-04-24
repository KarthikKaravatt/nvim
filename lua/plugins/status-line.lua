return {
  lazy = true,
  event = { "VeryLazy" },
  -- Calls `require('slimline').setup({})`
  "sschleemilch/slimline.nvim",
  opts = {
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
  },
}
