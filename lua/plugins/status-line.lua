-- lazy
return {
	"sontungexpt/sttusline",
	branch = "table_version",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		require("sttusline").setup()
	end,
}
