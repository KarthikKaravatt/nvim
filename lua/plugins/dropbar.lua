return {
	"Bekaboo/dropbar.nvim",
	event = { "BufReadPre", "BufNewFile", "VeryLazy" },
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
