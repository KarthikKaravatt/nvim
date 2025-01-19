return {
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	-- Calls `require('slimline').setup({})`
	"sschleemilch/slimline.nvim",
	opts = {
		verbose_mode = true,
		style = "fg",
		components = {
			left = {
				"mode",
				"git",
				"recording",
			},
		},
	},
}
