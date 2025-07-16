-- ~/.config/nvim/lua/plugins/editing.lua
return {
    -- Auto-pairing brackets and quotes
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    -- Smart commenting
    {
        "echasnovski/mini.comment",
        version = "*",
        config = function()
            require("mini.comment").setup()
        end,
    },
}
