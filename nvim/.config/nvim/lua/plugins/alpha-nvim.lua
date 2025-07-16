-- File: lua/plugins/alpha.lua

return {
	'goolord/alpha-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- For icons
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard')

		--[[
    We organize the configuration into logical sections (Quote, Header, Buttons, Footer)
    to make it easier to read and modify.
    ]]

		---------------------------------------------------------------------------------
		-- ## Quotes ##
		---------------------------------------------------------------------------------
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

		-- Seed the random number generator with better entropy
		math.randomseed(os.time() + os.clock() * 1000000)

		local function get_quote()
			return quotes[math.random(1, #quotes)]
		end

		---------------------------------------------------------------------------------
		-- ## Header ##
		---------------------------------------------------------------------------------
		-- Your original ASCII art header, now in its own section for clarity.
		local header = {
			[[     ___           ___           ___                                    ___     ]],
			[[    /__/\         /  /\         /  /\          ___        ___          /__/\    ]],
			[[    \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ]],
			[[     \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ]],
			[[ _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ]],
			[[/__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
			[[\  \:\‾‾\‾‾\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\‾‾\__\/]],
			[[ \  \:\  ‾‾‾   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ]],
			[[  \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ]],
			[[   \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ]],
			[[    \__\/         \__\/         \__\/           ‾‾‾‾                   \__\/    ]]
		}

		dashboard.section.header.val = header
		-- Optional: Add a highlight to the header text
		dashboard.section.header.opts.hl = 'Type'

		---------------------------------------------------------------------------------
		-- ## Buttons ##
		---------------------------------------------------------------------------------
		-- A simplified and reusable button factory function.
		-- It creates both the visual button and the underlying keymap.
		local function button(shortcut, text, command)
			local button_element = dashboard.button(shortcut, text, command)
			button_element.opts.hl = 'AlphaButtons'
			button_element.opts.hl_shortcut = 'AlphaShortcut'
			return button_element
		end

		-- Button definitions are now cleaner and include session management.
		local get_icon = require('nvim-web-devicons').get_icon
		local telescope_builtin = require('telescope.builtin')

		dashboard.section.buttons.val = {
			-- Use 'lua' as the file extension to get the appropriate icon for a new Lua file
			button('e', get_icon('init.lua', 'lua') .. '  New file', '<cmd>ene<CR>'),
			-- Use 'session' or a relevant extension for a session-related icon
			button('s', get_icon('session.vim', 'vim') .. '  Load session', '<cmd>SessionManager load_session<CR>'),
			-- Use 'file' or a relevant extension for a find file icon
			button('f', get_icon('file.txt', 'txt') .. '  Find file', '<cmd>Telescope find_files<CR>'),
			-- Use 'git' or a relevant extension for a Git icon (if available, otherwise fallback)
			button('g', get_icon('.git', nil) .. '  Git status', function()
				-- pcall attempts to run the function and returns true/false for success/failure
				local ok, err = pcall(telescope_builtin.git_status)

				if not ok then
					-- If git_status fails (e.g., not a git directory), handle the error.
					-- You can log the error or simply switch to find_files.
					if string.find(err, "is not a git directory") then
						print("Not a Git repository. Defaulting to find files.")
						-- If you want to fall back to find_files:
						-- telescope_builtin.find_files()
					else
						-- Handle other potential errors if needed
						vim.notify("Telescope Git Status error: " .. err, vim.log.levels.ERROR)
					end
				end
			end),
			-- Use 'history' or a relevant extension for recent files
			button('r', get_icon('history.md', 'md') .. '  Recent files', '<cmd>Telescope oldfiles<CR>'),
			-- Use a relevant extension for Lazy (e.g., 'lua' or a specific configuration file)
			button('l', get_icon('lazy.lua', 'lua') .. '  Lazy', '<cmd>Lazy<CR>'),
			-- Use 'config' or a relevant extension for configuration
			button('c', get_icon('init.lua', 'lua') .. '  Config', '<cmd>e $MYVIMRC | cd %:p:h <CR>'),
			-- Use a relevant icon for Quit (e.g., a generic icon)
			button('q', get_icon('quit.txt', 'txt') .. '  Quit', '<cmd>qa<CR>'),
		}

		---------------------------------------------------------------------------------
		-- ## Quote Section ##
		---------------------------------------------------------------------------------
		local quote_section = {
			type = 'text',
			val = { get_quote() },
			opts = {
				hl = 'AlphaQuote',
				position = 'center',
			},
		}

		---------------------------------------------------------------------------------
		-- ## Footer ##
		---------------------------------------------------------------------------------
		-- Enhanced footer with startup time, plugin stats, and Neovim version
		local function get_footer()
			local stats = require('lazy').stats()
			local ms = math.floor(stats.startuptime)
			local version = vim.version()
			local nvim_version = string.format("v%d.%d.%d", version.major, version.minor, version.patch)

			-- Create single-line footer
			local footer_lines = {
				string.format("%s Loaded plugins in %.3fms - %s %d loaded, %d not loaded - %s Neovim %s",
					get_icon('time.txt', 'txt') or '⚡', ms,
					get_icon('plugin.lua', 'lua') or '📦', stats.loaded, stats.count - stats.loaded,
					get_icon('neovim.vim', 'vim') or '🚀', nvim_version),
			}


			return {
				type = 'text',
				val = footer_lines,
				opts = {
					hl = 'Comment',
					position = 'center',
				},
			}
		end


		dashboard.section.footer = get_footer()

		-- -------------------------------------------------------------------------------
		-- ## Layout ##
		-- -------------------------------------------------------------------------------
		-- The complex layout calculations have been replaced with simple padding.
		-- This is more robust and easier to maintain. If you add or remove buttons,
		-- the layout adjusts automatically without needing manual recalculation.
		dashboard.config.layout = {
			{ type = 'padding', val = 0 },
			dashboard.section.header,
			{ type = 'padding', val = 1 },
			quote_section,
			{ type = 'padding', val = 2 },
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		---------------------------------------------------------------------------------
		-- ## Custom Highlights ##
		---------------------------------------------------------------------------------
		-- Set up custom highlight groups for better visual appeal
		vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#7aa2f7', italic = true })
		vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#a9b1d6' })
		vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#bb9af7', bold = true })

		---------------------------------------------------------------------------------
		-- ## Buffer-local Keymaps ##
		---------------------------------------------------------------------------------
		-- Set up buffer-local keymaps that only work in the alpha buffer
		vim.api.nvim_create_autocmd('User', {
			pattern = 'AlphaReady',
			callback = function()
				local buf = vim.api.nvim_get_current_buf()

				-- Update the quote each time alpha is displayed
				quote_section.val = { get_quote() }

				-- Update footer with current stats
				local stats = require('lazy').stats()
				local ms = math.floor(stats.startuptime)
				local version = vim.version()
				local nvim_version = string.format("v%d.%d.%d", version.major, version.minor, version.patch)

				dashboard.section.footer.val = {
					string.format("%s Loaded plugins in %.3fms - %s %d loaded, %d not loaded - %s Neovim %s",
						get_icon('time.txt', 'txt') or '⚡', ms,
						get_icon('plugin.lua', 'lua') or '📦', stats.loaded, stats.count - stats.loaded,
						get_icon('neovim.vim', 'vim') or '🚀', nvim_version),

					-- string.format("⚡ Neovim loaded %d/%d plugins in %.2fms", stats.loaded, stats.count, ms),
					-- string.format("📦 %d loaded, %d not loaded", stats.loaded, stats.count - stats.loaded),
					-- string.format("🚀 Neovim %s", nvim_version),
				}

				-- Set buffer-local keymaps that override global ones
				local opts = { noremap = true, silent = true, buffer = buf }

				vim.keymap.set('n', 'e', '<cmd>ene<CR>', opts)
				vim.keymap.set('n', 's', '<cmd>SessionManager load_session<CR>', opts)
				vim.keymap.set('n', 'f', '<cmd>Telescope find_files<CR>', opts)
				vim.keymap.set('n', 'g', function()
					local ok, err = pcall(telescope_builtin.git_status)
					if not ok then
						if string.find(err, "is not a git directory") then
							print("Not a Git repository. Defaulting to find files.")
						else
							vim.notify("Telescope Git Status error: " .. err, vim.log.levels.ERROR)
						end
					end
				end, opts)
				vim.keymap.set('n', 'r', '<cmd>Telescope oldfiles<CR>', opts)
				vim.keymap.set('n', 'l', '<cmd>Lazy<CR>', opts)
				vim.keymap.set('n', 'c', '<cmd>e $MYVIMRC | cd %:p:h <CR>', opts)
				vim.keymap.set('n', 'q', '<cmd>qa<CR>', opts)
			end,
		})

		---------------------------------------------------------------------------------
		-- ## Final Setup ##
		---------------------------------------------------------------------------------
		alpha.setup(dashboard.config)
	end,
}
