local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return vim.api.nvim_win_get_height(0) * 0.5
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  shell = "powershell"

}

vim.keymap.set('n', '<C-t>', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<S-t>', ':ToggleTerm direction=float<CR>')
