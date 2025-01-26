if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono NF:h12"
	vim.g.neovide_transparency = 0.7
	vim.g.neovide_normal_opacity = 0.7
	vim.g.neovide_scroll_animation_far_lines = 1
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_cursor_vfx_mode = "pixiedust"

	-- Set neovide directory to home
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		callback = function()
			vim.cmd("cd ~")
		end,
	})
end
