function Watch_tests()
	if vim.o.filetype == "javascript" then
		require("neotest").run.run({ vim.fn.expand("%"), vitestCommand = "npx vitest -w" })
	else
		require("neotest").watch.toggle(vim.fn.expand("%"))
	end
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"marilari88/neotest-vitest",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
				require("neotest-vitest")({
					vitestCommand = "npx vitest -w",
				}),
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ntw",
			--"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
			--"<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
			"<cmd>lua Watch_tests()<cr>",
			{}
		)
		vim.api.nvim_set_keymap("n", "<leader>ntf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>nts", "<cmd>lua require('neotest').summary.toggle()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>ntr", "<cmd>lua require('neotest').run.run()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>nto", "<cmd>lua require('neotest').output_panel.toggle()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>ntd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {})
	end,
}
