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
-- require("lazy").setup(
--     "plugins"
-- -- {
-- -- 	defaults = {
-- -- 		git = {
-- -- 			timeout = 1200,
-- -- 		},
-- -- 	},
-- -- }
-- )

require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyodark" } },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
        notify = false,
    },

    performance = {
        disables_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },

    change_detection = {
        enabled = true,
        notify = false,
    },

    pkg = {
        enabled = true,
        sources = {
            "lazy",
            "packspec",
        },
    },
    ui = {
        size = { width = 0.75, height = 0.70 },
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
        backdrop = 50,
        title = " Plugins 󰩦 ",
    },
})

vim.keymap.set("n", "<leader>L", ":Lazy<CR>", { desc = "Open Lazy plugin manager" })
