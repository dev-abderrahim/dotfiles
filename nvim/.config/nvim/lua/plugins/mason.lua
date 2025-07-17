return {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
        { '<leader>M', ':Mason<CR>', desc = 'Launch Mason' },
    },

    config = function()
        require('mason').setup({
            PATH = "append",
            max_concurrent_installers = 1,
            ui = {
                check_outdated_packages_on_open = true,
                border = "none",
                width = 0.75,
                height = 0.70,
                icons = {
                    package_installed = " ",
                    package_pending = "󱦟",
                    package_uninstalled = "󰚌 "
                }

            }
        })

        vim.keymap.set('n', '<leader>M', ':Mason<CR>', { desc = 'launch Mason' })
    end

}
