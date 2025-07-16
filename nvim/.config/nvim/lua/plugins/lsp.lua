return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			{
				"zbirenbaum/neodim",
				config = function()
					require("neodim").setup({
						alpha = 0.5,
						blend_color = "#000000",
						hide = { underline = true },
					})
				end
			}
		},


		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 1. Define Language Servers *FIRST*
			local servers = {
				-- clangd = {},  -- C/C++/Objective-C
				-- jsonls = {},  -- JSON
				-- ts_ls = {},   -- TypeScript/JavaScript
				-- pyright = {}, -- Python
				-- bashls = {},  -- Shell scripts
				-- lua_ls = {},  -- Lua
			}

			-- 2. Setup Mason (now 'servers' is defined)
			require("mason").setup()
			require("mason-lspconfig").setup({
				-- Now vim.tbl_keys(servers) works correctly
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			})

			-- 3. Setup each server
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end


			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- 4. Auto-Formatting on Save (LspAttach Autocommand)

			-- Create an Autogroup specifically for LSP formatting
			local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

			-- Set up the LspAttach autocmd
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_format_augroup,
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					-- Check if the client supports document formatting
					if client and client.server_capabilities.documentFormattingProvider then
						-- Create a BufWritePre autocommand specific to this buffer (bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = lsp_format_augroup,
							buffer = bufnr,
							callback = function()
								-- Trigger LSP formatting before saving
								vim.lsp.buf.format({
									async = false, -- Ensure formatting completes before save
									timeout_ms = 500,
									id = client.id,
								})
							end,
						})
					end
				end,
			})

			-- 5. NeoDim configuration
			require("neodim").setup({
				alpha = 0.5,
				blend_color = "#000000",
				hide = { underline = true },
			})
		end,
	},
}
