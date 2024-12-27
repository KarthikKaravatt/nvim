return {
	"OXY2DEV/markview.nvim",
	event = { "BufRead *.md" },
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
