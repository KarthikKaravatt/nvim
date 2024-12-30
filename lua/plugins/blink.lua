return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets", { "L3MON4D3/LuaSnip", version = "v2.*" } },
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
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
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		sources = {
			default = { "lsp", "path", "snippets", "luasnip", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
