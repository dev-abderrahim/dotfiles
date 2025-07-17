return {
    'echasnovski/mini.indentscope',
    version = false,
    -- enabled = false,
    config = function()
        require('mini.indentscope').setup({
            -- symbol = '╎',
            symbol = '│',
        })
    end,
}
