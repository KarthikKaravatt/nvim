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

