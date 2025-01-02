return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	keys = {
		{
			"_",
			function()
				vim.cmd("Oil")
			end,
		},
	},
}
