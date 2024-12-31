-- lazy
return {
	"sontungexpt/sttusline",
	branch = "table_version",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, opts)
		require("sttusline").setup({
			statusline_color = "#222d3d",
			disabled = {
				filetypes = {
					-- "NvimTree",
					-- "lazy",
				},
				buftypes = {
					"terminal",
				},
			},
			components = {
				"mode",
				"os-uname",
				"filename",
				"git-branch",
				"git-diff",
				"%=",
				"diagnostics",
				"lsps-formatters",
				"copilot",
				"copilot-loading",
				"indent",
				"encoding",
				"pos-cursor",
				"pos-cursor-progress",
			},
		})
	end,
}
