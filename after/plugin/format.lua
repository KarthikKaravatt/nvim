require("lsp-format").setup { }

require("typescript-tools").setup { on_attach = require("lsp-format").on_attach }
