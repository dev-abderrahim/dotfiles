return {
    'nvimdev/dashboard-nvim',
    dependencies = {
        "echasnovski/mini.icons",
        -- 'nvim-tree/nvim-web-devicons',
    },

    -- event = "VimEnter",

    init = function()
        local g = vim.g
        math.randomseed(os.time())

        local quotes = {
            "The only way to do great work is to love what you do. - Steve Jobs",
            "Innovation distinguishes between a leader and a follower. - Steve Jobs",
            "Code is like humor. When you have to explain it, it's bad. - Cory House",
            "First, solve the problem. Then, write the code. - John Johnson",
            "Experience is the name everyone gives to their mistakes. - Oscar Wilde",
            "In order to be irreplaceable, one must always be different. - Coco Chanel",
            "Java is to JavaScript what car is to Carpet. - Chris Heilmann",
            "Knowledge is power. - Francis Bacon",
            "Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday's code. - Dan Salomon",
            "Perfection is achieved not when there is nothing more to add, but rather when there is nothing more to take away. - Antoine de Saint-Exupery",
            "Ruby is rubbish! PHP is phpantastic! - Nikita Popov",
            "Code never lies, comments sometimes do. - Ron Jeffries",
            "Simplicity is the ultimate sophistication. - Leonardo da Vinci",
            "Make it work, make it right, make it fast. - Kent Beck",
            "The best error message is the one that never shows up. - Thomas Fuchs",
            "Debugging is twice as hard as writing the code in the first place. - Brian Kernighan",
            "Talk is cheap. Show me the code. - Linus Torvalds",
            "Programs must be written for people to read, and only incidentally for machines to execute. - Harold Abelson",
            "The most important property of a program is whether it accomplishes the intention of its user. - C.A.R. Hoare",
            "Any fool can write code that a computer can understand. Good programmers write code that humans can understand. - Martin Fowler"
        }

        local dashboard_header = {
            "",
            "                                                                     ",
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
            "",
        }

        local dashboard_footer = {}
        local footer_text = " " .. quotes[math.random(#quotes)] .. "  "
        table.insert(dashboard_footer, 1, "")
        table.insert(dashboard_footer, 2, "")
        table.insert(dashboard_footer, 3, footer_text)

        g.dashboard_custom_header = dashboard_header
        g.dashboard_custom_footer = dashboard_footer
    end,

    config = function()
        require("dashboard").setup({
            theme = "hyper",
            disable_move = true,
            shortcut_type = "letter",
            shuffle_letter = false,
            change_to_vcs_root = false,
            config = {
                header = vim.g.dashboard_custom_header,
                week_header = {
                    enable = false,
                },
                packages = { enable = true },
                shortcut = {
                    { desc = " Updates", group = "@boolean", key = "u", action = "Lazy update" },
                    {
                        desc = "󰥨 Find",
                        group = "Number",
                        key = "f",
                        action = function()
                            Snacks.picker.files({ cwd = "~/" })
                        end,
                    },
                    {
                        desc = " Dotfiles",
                        group = "@function",
                        key = "d",
                        action = function()
                            Snacks.picker.files({ cwd = "~/.dotfiles/" })
                        end,
                    },
                    {
                        desc = " Config",
                        group = "@attribute.builtin",
                        key = "c",
                        action = function(path)
                            Snacks.picker.files({ cwd = "~/.config/nvim/" })
                        end,
                    },
                    { desc = " Recents", group = "Keyword", key = "r", action = "lua Snacks.picker.recent()" },
                },
                project = {
                    action = function(path)
                        ---@class snacks.picker.files.Config
                        Snacks.picker.files({ cwd = path })
                    end,
                    enable = true,
                    limit = 5,
                    icon = " ",
                    label = "Recent Projects",
                },
                mru = { enable = true, icon = " ", limit = 8, label = "Recently edited", cwd_only = false },
                footer = vim.g.dashboard_custom_footer,
            },
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            },
            preview = {},
        })
    end
}
