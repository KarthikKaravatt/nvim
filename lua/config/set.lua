-- vim.cmd([[colorscheme kanso]])

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#FFFFFF", bg = "#000000", bold = false })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#FFFFFF", bg = "#000000", bold = false })

vim.g.have_nerd_font = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "79"
vim.opt.textwidth = 78
vim.opt.fileformat = "unix"
vim.opt.conceallevel = 2

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.showtabline = 0

-- Remove tilde lines
vim.opt.fillchars = { eob = " " }

-- set border
vim.o.winborder = 'rounded'
