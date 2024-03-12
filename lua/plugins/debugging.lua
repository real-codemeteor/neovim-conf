return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()

		local python_path = vim.fn.system({ "which", "python" })
		require("dap-python").setup(python_path)
		table.insert(require("dap").configurations.python, {
			type = "python",
			request = "launch",
			name = "My launcher",
			program = "${file}",
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
        vim.keymap.set("n", "<S-F5>", function()
            dap.disconnect({ terminateDebuggee = true })
        end)
        vim.keymap.set("n", "<C-S-F5>", function()
            dap.restart()
        end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#31353f" })

		vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
		vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
		vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🐞", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "🌩️", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "⁉️", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "🪵", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)
	end,
}
