return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local keymap = vim.keymap -- for conciseness

			keymap.set(
				"n",
				"<leader>db",
				"<cmd>lua require('dap').toggle_breakpoint()<CR>",
				{ desc = "Toggle breakpoint" }
			)
			keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", { desc = "Run last debug session" })
			keymap.set("n", "<leader>dr", "<cmd>lua require('dap').continue()<CR>", { desc = "Run debugger" })
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)

			local keymap = vim.keymap -- for conciseness

			keymap.set(
				"n",
				"<leader>dt",
				"<cmd>lua require('dap-python').test_method()<CR>",
				{ desc = "Run closest test method" }
			)
		end,
	},
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
