return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,

			--	null_ls.builtins.formatting.black,
			--	null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.ruff"),
                require("none-ls.formatting.ruff"),
                null_ls.builtins.diagnostics.mypy,

				null_ls.builtins.formatting.prettier,
				--null_ls.builtins.diagnostics.eslint_d,

				null_ls.builtins.diagnostics.hadolint,

				null_ls.builtins.code_actions.refactoring,

				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.formatting.djlint,
				require("none-ls.code_actions.eslint_d"),
				require("none-ls.diagnostics.eslint_d"),

			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {})
        vim.keymap.set("n", "<leader>gN", vim.diagnostic.goto_prev, {})
	end,
}
