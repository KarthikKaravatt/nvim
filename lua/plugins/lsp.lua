return {

	-- LSP Plugins
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
		},
		opts = {},
		init = function(_, opts)
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
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
				automatic_installation = false,
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
		end,
	},
}
