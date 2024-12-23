local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					-- Debug single nodejs files
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug nodejs processes (make sure to add --inspect when you run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug web applications (client side)
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({
									prompt = "Enter URL: ",
									default = "http://localhost:3000",
								}, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
					},
					-- Divider for the launch.json derived configs
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end
		end,
		keys = {
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>gb",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to cursor",
			},
			{
				"<leader>?",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Evalulate under cursor",
			},
			{
				"<F1>",
				function()
					if vim.fn.filereadable(".vscode/launch.json") then
						local dap_vscode = require("dap.ext.vscode")
						dap_vscode.load_launchjs(nil, {
							["pwa-node"] = js_based_languages,
							["firefox"] = js_based_languages,
							["pwa-firefox"] = js_based_languages,
						})
					end
					require("dap").continue()
				end,
			},
			{
				"<F2>",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<F3>",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<F4>",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<F5>",
				function()
					require("dap").step_back()
				end,
				desc = "Step back",
			},
			{
				"<F6>",
				function()
					require("dap").restart()
				end,
				desc = "restart",
			},
		},
	},
	{
		"microsoft/vscode-js-debug",
		build = function()
			-- Determine the operating system
			local os_name = vim.loop.os_uname().sysname

			-- Define the commands for each OS
			local commands = {
				Linux = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
				Windows = [[npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rmdir /s /q out && move dist out]],
			}

			-- Choose the command based on the operating system
			local command = commands[os_name] or "echo 'Unsupported OS'"

			-- Run the command
			vim.fn.system(command)
		end,
		version = "1.*",
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		event = { "BufRead *.tsx", "BufRead *.ts", "BufRead *.js", "BufRead *.jsx" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("dap-vscode-js").setup({
				-- Path of node executable. Defaults to $NODE_PATH, and then "node"
				-- node_path = "node",

				-- Path to vscode-js-debug installation.
				debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

				-- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
				-- debugger_cmd = { "js-debug-adapter" },

				-- which adapters to register in nvim-dap
				adapters = {
					"chrome",
					"firefox",
					"pwa-node",
					"pwa-chrome",
					"pwa-firefox",
					"pwa-msedge",
					"pwa-extensionHost",
					"node-terminal",
				},

				-- Path for file logging
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log",

				-- Logging level for output to file. Set to false to disable logging.
				-- log_file_level = false,

				-- Logging level for output to console. Set to false to disable console output.
				-- log_console_level = vim.log.levels.ERROR,
			})
		end,
	},
}
