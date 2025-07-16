-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Installs and updates parsers
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "c", "cpp", "java", "lua", "vim", "vimdoc", "query", "python", "javascript", "typescript", "json", "html", "css", "bash", "lua" },

			-- Install parsers synchronously (only applied on startup)
			sync_install = false,

			-- Automatically install missing parsers when entering a buffer
			auto_install = true,

			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable better indentation
			},
		})
	end,
}
