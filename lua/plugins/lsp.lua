return {
	-- LSP Plugins
	{
		"folke/lazydev.nvim",
		event = "VeryLazy",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "VeryLazy" },
		init = function(_, _)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts_local = { buffer = event.buf }
					vim.keymap.set(
						"n",
						"K",
						"<cmd>lua vim.lsp.buf.hover()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Show hover information" })
					)
					vim.keymap.set(
						"n",
						"gd",
						"<cmd>lua vim.lsp.buf.definition()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Go to definition" })
					)
					vim.keymap.set(
						"n",
						"gD",
						"<cmd>lua vim.lsp.buf.declaration()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Go to declaration" })
					)
					vim.keymap.set(
						"n",
						"gi",
						"<cmd>lua vim.lsp.buf.implementation()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Go to implementation" })
					)
					vim.keymap.set(
						"n",
						"go",
						"<cmd>lua vim.lsp.buf.type_definition()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Go to type definition" })
					)
					vim.keymap.set(
						"n",
						"gr",
						"<cmd>lua vim.lsp.buf.references()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Show references" })
					)
					vim.keymap.set(
						"n",
						"gs",
						"<cmd>lua vim.lsp.buf.signature_help()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Show signature help" })
					)
					vim.keymap.set(
						"n",
						"gl",
						"<cmd>lua vim.diagnostic.open_float()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Show diagnostics" })
					)
					vim.keymap.set(
						"n",
						"<F2>",
						"<cmd>lua vim.lsp.buf.rename()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Rename symbol" })
					)
					vim.keymap.set(
						{ "n", "x" },
						"<F3>",
						"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Format code" })
					)
					vim.keymap.set(
						"n",
						"<F4>",
						"<cmd>lua vim.lsp.buf.code_action()<cr>",
						vim.tbl_extend("force", opts_local, { desc = "Show code actions" })
					)
				end,
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = { "VeryLazy" }, -- Defers loading until after initial startup
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls" },
			automatic_installation = false,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
	},
}
