return {
	lazy = true,
	event = { "VeryLazy" },
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
