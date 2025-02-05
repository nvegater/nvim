return {
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local omnisharp_extended = require("omnisharp_extended")

			lspconfig.csharp_ls.setup({
				handlers = {
					["textDocument/definition"] = omnisharp_extended.handler,
				},
				on_attach = function(client, bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Format on save
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
				-- Additional settings for C# LSP
				settings = {
					-- You can add custom LSP settings here
					-- For example:
					-- analyzers = {
					--   enable = true,
					-- },
				},
			})
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"Issafalcon/neotest-dotnet",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-dotnet")({
						-- Here you can customize discovery logic or add different test project patterns
						discovery_root = "solution", -- or "project" or "directory"
					}),
				},
			})

			-- Add keymaps for testing
			vim.keymap.set("n", "<leader>tt", function()
				require("neotest").run.run()
			end, { desc = "Run nearest test" })

			vim.keymap.set("n", "<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Run tests in current file" })

			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").summary.toggle()
			end, { desc = "Toggle test summary" })
		end,
	},
}
