return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets", { "L3MON4D3/LuaSnip", version = "v2.*" } },
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
		keymap = {
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-b>"] = { "scroll_documentation_down", "fallback" },
			["<C-f>"] = { "scroll_documentation_up", "fallback" },
			["<C-y>"] = { "select_and_accept", "fallback" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
