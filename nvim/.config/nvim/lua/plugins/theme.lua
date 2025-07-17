-- ~/.config/nvim/lua/plugins/theme.lua
return {
    {
        "tiagovla/tokyodark.nvim",
        -- enabled = false,
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme tokyodark]]
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        enabled = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = false,
                italic_comments = true,
                cache = true,
            })
            vim.cmd("colorscheme cyberdream")
        end,
    },
}
