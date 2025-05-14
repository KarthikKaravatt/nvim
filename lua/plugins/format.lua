return {
  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<C-f>",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        --   cs = { "csharpier" },
        --   -- Conform can also run multiple formatters sequentially
        --   -- python = { "isort", "black" },
        --   --
        --   -- You can use 'stop_after_first' to run the first available formatter from the list
        --   -- javascript = { "prettierd", "prettier", stop_after_first = true },
        -- },
        -- formatters = {
        --   csharpier = {
        --     command = "csharpier",
        --     args = { "format", ".", "--write-stdout" },
        --   }
      }
    },
  },
}
