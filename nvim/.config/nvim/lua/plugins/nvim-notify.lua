-- ./lua/plugins/nvim-notify.lua

return {
    "rcarriga/nvim-notify",
    -- Configure nvim-notify to be the default notification system for Neovim.
    config = function()
        -- This function is called after the plugin is loaded.
        -- Set vim.notify to nvim-notify's notify function.
        vim.notify = require("notify")

        -- Optional: Configure nvim-notify
        require("notify").setup({
            -- Customize notification timeout (in ms)
            timeout = 5000,
            -- Choose a render style (e.g., "default", "minimal", "compact")
            render = "minimal",
            -- Customize the window layout (e.g., position, width)
            stages = "slide", -- Animation style
            top_down = false, -- Set the notification at bottom
            max_height = function() return math.floor(vim.opt.lines:get() * 0.75) end,
            max_width = function() return math.floor(vim.opt.columns:get() * 0.4) end,
        })
    end,
}
