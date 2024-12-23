return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	keys = {
		{
			"-",
			function()
				vim.cmd("Oil")
			end,
		},
	},
}
