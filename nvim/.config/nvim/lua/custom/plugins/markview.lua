return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    ft = { "markdown", "yaml", "html", "latex" },
    dependencies = {
        -- "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    -- For `nvim-treesitter` users.
    priority = 49,

    config = function()
        require("markview").setup({
            preview = {
                enabled = true,
                icon_provider = "mini",
            },
            experimental = {
                check_rtp = false
            }
        })
    end
};
