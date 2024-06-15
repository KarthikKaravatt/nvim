local builtin = require('telescope.builtin')
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


