-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- primogen remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.api.nvim_set_keymap("n", "<Leader>P", '"+p', { noremap = true, silent = true })

-- Increase/decrease horizontal split size
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })

-- Increase/decrease vertical split size
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Set working directory to the same as the current file
vim.keymap.set(
  "n",
  "`",
  ":cd %:p:h<CR>:pwd<CR>",
  { noremap = true, silent = true, desc = "Set CWD to current file's directory" }
)

-- Set working directory to the parent directory of the current file
vim.keymap.set(
  "n",
  "<C-`>",
  ":cd %:p:h:h<CR>:pwd<CR>",
  { noremap = true, silent = true, desc = "Set CWD to parent directory" }
)
