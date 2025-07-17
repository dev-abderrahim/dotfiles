-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufAdd",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter")
        local configs = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line: missing-fields
        configs.setup({
            ensure_installed = { "c", "cpp", "java", "lua", "vim", "vimdoc", "query", "python", "javascript", "typescript", "json", "html", "css", "bash", "lua", "latex", "norg", "scss", "svelte", "tsx", "vue", "regex" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
