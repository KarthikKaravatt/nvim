return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	event = "VeryLazy",
	keys = {
		{ "za" },
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
		},
	},
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
	init = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
}
