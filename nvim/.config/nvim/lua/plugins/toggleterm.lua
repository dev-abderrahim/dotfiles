-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]], -- Standard mapping
			hide_numbers = true,
			shade_terminals = true,
			direction = "float", -- Use a floating window
			border = "double",
		})
	end,
}
