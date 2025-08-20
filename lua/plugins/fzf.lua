vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua"
})
local fzf = require("fzf-lua")
fzf.setup();
vim.keymap.set("n", '<leader>ff',
  function()
    fzf.files()
  end
)
vim.keymap.set("n", '<leader>fb',
  function()
    fzf.buffers()
  end
)
vim.keymap.set("n", '<leader>fg',
  function()
    fzf.live_grep_native()
  end
)
vim.keymap.set("n", '<leader>gd',
  function()
    fzf.git_diff()
  end
)

vim.keymap.set("n", '<leader>ld',
  function()
    fzf.diagnostics_document()
  end
)

vim.keymap.set("n", '<leader>lr',
  function()
    fzf.lsp_references()
  end
)
