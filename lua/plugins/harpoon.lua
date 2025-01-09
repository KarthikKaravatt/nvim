return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		Harpoon = require("harpoon")
		Harpoon:setup()
	end,
	keys = {
		{
			"<leader>a",
			function()
				Harpoon:list():add()
			end,
		},
		{
			"<C-e>",
			function()
				Harpoon.ui:toggle_quick_menu(Harpoon:list())
			end,
		},
		{
			"<C-h>",
			function()
				Harpoon:list():select(1)
			end,
		},
		{
			"<C-j>",
			function()
				Harpoon:list():select(2)
			end,
		},
		{
			"<C-k>",
			function()
				Harpoon:list():select(3)
			end,
		},
		{
			"<C-l>",
			function()
				Harpoon:list():select(4)
			end,
		},
	},
}
