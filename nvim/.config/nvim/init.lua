-- ~/.config/nvim/init.lua

-- =============================================================================
-- LAZY.NVIM BOOTSTRAP
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- LOAD CORE CONFIGURATION
-- =============================================================================
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- =============================================================================
-- LOAD PLUGINS
-- =============================================================================
-- The setup function will be called by lazy.nvim
require("lazy").setup(
	"plugins"
-- {
-- 	defaults = {
-- 		git = {
-- 			timeout = 1200,
-- 		},
-- 	},
-- }
)
