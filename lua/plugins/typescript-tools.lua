return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	event = { "BufRead *.tsx", "BufRead *.ts" },
	opts = {},
}
