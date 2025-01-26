if vim.loop.os_uname().sysname == "Windows_NT" then
	-- Windows-specific settings (PowerShell)
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellquote = '"'
	vim.opt.shellxquote = ""
else
	-- Linux-specific settings (Bash or Zsh)
	vim.opt.shell = "/bin/bash" -- Replace with "/bin/zsh" if you use Zsh
	vim.opt.shellcmdflag = "-c"
	vim.opt.shellquote = '"'
	vim.opt.shellxquote = ""
end
