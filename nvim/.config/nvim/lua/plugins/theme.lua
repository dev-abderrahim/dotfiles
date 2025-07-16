-- ~/.config/nvim/lua/plugins/theme.lua
return {
	-- {
	--   "scottmckendry/cyberdream.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     require("cyberdream").setup({
	--       transparent = true,
	--       italic_comments = true,
	--       cache = true,
	--     })
	--     vim.cmd("colorscheme cyberdream")
	--   end,
	-- },
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.opt.background = "dark"
	-- 		vim.cmd.colorscheme "oxocarbon"
	--
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('nightfox').setup({
	-- 			options = {
	-- 				transparent = true, -- Disable setting background
	-- 				terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	-- 				colorblind = {
	-- 					enable = false, -- Enable colorblind support
	-- 					simulate_only = true, -- Only show simulated colorblind colors and not diff shifted
	-- 					severity = {
	-- 						protan = 0.8, -- Severity [0,1] for protan (red)
	-- 						deutan = 0.5, -- Severity [0,1] for deutan (green)
	-- 						tritan = 0, -- Severity [0,1] for tritan (blue)
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme "terafox"
	-- 	end,
	-- },
	{
		"nvimdev/indentmini.nvim",
		lazy = false,
		config = function()
			require("indentmini").setup()
			-- Highlight colors for indent lines
			vim.cmd.highlight("IndentLine guifg=#091f2e")
			vim.cmd.highlight("IndentLineCurrent guifg=#33859E")
		end,
	},
	{
		"ya2s/nvim-cursorline",
		config = function()
			require('nvim-cursorline').setup {
				cursorline = {
					enable = false,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 1,
					hl = { underline = true },
				}
			}
		end
	}
}
