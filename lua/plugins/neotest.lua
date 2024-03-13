return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "pytest",
				}),
				require("neotest-jest")({
					-- jestCommand = "npm test --",
					--                    jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
					-- .. " --watch",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ntw",
			--"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
			"<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
			{}
		)
		vim.api.nvim_set_keymap("n", "<leader>ntf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>nts", "<cmd>lua require('neotest').summary.toggle()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>ntr", "<cmd>lua require('neotest').run.run()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>nto", "<cmd>lua require('neotest').output_panel.toggle()<cr>", {})

		vim.api.nvim_set_keymap("n", "<leader>ntd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {})
	end,
}
