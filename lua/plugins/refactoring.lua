return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup()
		require("telescope").load_extension("refactoring")

		vim.keymap.set({ "n", "x" }, "<leader>tr", function()
			require("telescope").extensions.refactoring.refactors()
		end)

        vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename)
	end,
}
