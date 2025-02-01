return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = false, -- Default to false
		},
	},
	lazy = true,
	keys = {
		{
			"_",
			function()
				vim.cmd("Oil")
			end,
		},
	},
	-- Define the :osh command directly in the return table
	init = function()
		-- Variable to track the state of show_hidden
		local show_hidden = false

		vim.api.nvim_create_user_command("Osh", function()
			-- Toggle the show_hidden state
			show_hidden = not show_hidden

			-- Update the oil configuration with the toggled state
			require("oil").setup({
				view_options = {
					show_hidden = show_hidden,
				},
			})

			-- Reload oil in the current directory
			require("oil").open(".")

			-- Notify the user of the current state
			print("Oil: show_hidden set to " .. tostring(show_hidden))
		end, {})
	end,
}
