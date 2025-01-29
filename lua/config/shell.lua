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

vim.api.nvim_create_autocmd({ "TermEnter", "TermLeave" }, {
	pattern = "*",
	callback = function()
		if vim.o.buftype == "terminal" then
			if vim.fn.mode() == "t" then
				vim.opt_local.relativenumber = false
				vim.opt_local.number = false
			else
				vim.opt_local.number = true
				vim.opt_local.relativenumber = true
			end
		end
	end,
})
