-- ~/.config/nvim/lua/plugins/which-key.lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	delay = 200,
	config = function()
		require("which-key").setup({
			preset = 'modern',
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = false,
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			win = {
				no_overlap = true,
				border = "single",
				padding = { 1, 2 },
			},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>c", group = "code" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>l", group = "lsp" },
					{ "<leader>w", group = "window" },
					{ '<leader>b', group = 'buffer' },
					{ "`",         group = "registers" },
				},
			},
		})
	end,
}
