-- config/flash.lua
local M = {}

-- Flash.nvim action handlers
local flash_actions = {
    jump = function()
        require("flash").jump()
    end,

    treesitter = function()
        require("flash").treesitter()
    end,

    remote = function()
        require("flash").remote()
    end,

    treesitter_search = function()
        require("flash").treesitter_search()
    end,

    toggle = function()
        require("flash").toggle()
    end,
}

-- Keymap definitions
local function get_keymaps()
    return {
        {
            key = "s",
            mode = { "n", "x", "o" },
            action = flash_actions.jump,
            desc = "Flash Jump"
        },
        {
            key = "S",
            mode = { "n", "x", "o" },
            action = flash_actions.treesitter,
            desc = "Flash Treesitter"
        },
        {
            key = "r",
            mode = "o",
            action = flash_actions.remote,
            desc = "Remote Flash"
        },
        {
            key = "R",
            mode = { "o", "x" },
            action = flash_actions.treesitter_search,
            desc = "Treesitter Search"
        },
        {
            key = "<c-s>",
            mode = "c",
            action = flash_actions.toggle,
            desc = "Toggle Flash Search"
        },
    }
end

-- Convert keymap definitions to lazy.nvim format
local function create_lazy_keys()
    local keymaps = get_keymaps()
    local lazy_keys = {}

    for _, keymap in ipairs(keymaps) do
        table.insert(lazy_keys, {
            keymap.key,
            mode = keymap.mode,
            keymap.action,
            desc = keymap.desc
        })
    end

    return lazy_keys
end

-- Plugin configuration
function M.get_config()
    return {
        -- Add any flash.nvim specific configuration here
        -- For example:
        -- search = {
        --     multi_window = true,
        --     forward = true,
        --     wrap = true,
        -- },
        -- jump = {
        --     jumplist = true,
        --     pos = "start",
        --     history = false,
        -- },
    }
end

-- Main plugin specification
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = create_lazy_keys(),
    opts = M.get_config(),
}

-- return {
--     "folke/flash.nvim",
--     event = "VeryLazy",
--     -- enabled = false,
--     keys = {
--         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
--         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
--         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
--         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
--     },
-- }
