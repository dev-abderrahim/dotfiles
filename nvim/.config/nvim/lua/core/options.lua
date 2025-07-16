-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt -- for conciseness

-- =============================================================================
-- GENERAL
-- =============================================================================
opt.mouse = "a"               -- Enable mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false          -- Don't use swapfile
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- =============================================================================
-- UI
-- =============================================================================
opt.number = true        -- Show line numbers
opt.scrolloff = 5        -- Keep 5 lines of context around the cursor
opt.signcolumn = "yes"   -- Always show the sign column
opt.updatetime = 250     -- Faster update time
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Enable syntax highlighting and filetype detection
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- =============================================================================
-- TABS & INDENTATION
-- =============================================================================
-- opt.expandtab = true  -- Use spaces instead of tabs
opt.tabstop = 4       -- Number of spaces a <Tab> counts for
opt.softtabstop = 4   -- Number of spaces to insert for a <Tab>
opt.shiftwidth = 4    -- Number of spaces for auto-indent
opt.autoindent = true -- Copy indent from current line when starting a new one
opt.textwidth = 100   -- Wrap lines at 100 characters

-- Optional: configure list characters for viewing whitespace
opt.list = true
opt.listchars = { tab = '» ', trail = '·', extends = '»', precedes = '«', nbsp = '×' }
