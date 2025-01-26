return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	lazy = false,
	keys = {
		{
			"_",
			function()
				vim.cmd("Oil")
			end,
		},
	},
}
