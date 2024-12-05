-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local wk = require("which-key")

		wk.add({
			{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover item" },
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto definition" },
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto declaration" },
			{ "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto implementation" },
			{ "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Goto type definition" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Goto references" },
			{ "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Open diagnostics" },
			{ "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature help" },
			{ "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
			{ "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Code action" },
			{ "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
		})
	end,
})

-- vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Setup up lsps here

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"basedpyright",
		"tailwindcss",
		"eslint",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- CMP

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

--- nonels
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "prettierd" },
})
