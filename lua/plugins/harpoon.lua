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
			"<C-6>",
			function()
				Harpoon:list():select(1)
			end,
		},
		{
			"<C-7>",
			function()
				Harpoon:list():select(2)
			end,
		},
		{
			"<C-8>",
			function()
				Harpoon:list():select(3)
			end,
		},
		{
			"<C-9>",
			function()
				Harpoon:list():select(4)
			end,
		},
		{
			"<C-0>",
			function()
				Harpoon:list():select(5)
			end,
		},
	},
}
