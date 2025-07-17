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
opt.sidescroll = 5       -- Keep 5 lines of context around the cursor
opt.signcolumn = "yes"   -- Always show the sign column
opt.updatetime = 250     -- Faster update time
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Enable syntax highlighting and filetype detection
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- =============================================================================
-- TABS & INDENTATION
-- =============================================================================
opt.expandtab = true  -- Use spaces instead of tabs
opt.wrap = false      -- disbale wraping
opt.tabstop = 4       -- Number of spaces a <Tab> counts for
opt.softtabstop = 4   -- Number of spaces to insert for a <Tab>
opt.shiftwidth = 4    -- Number of spaces for auto-indent
opt.autoindent = true -- Copy indent from current line when starting a new one
opt.textwidth = 100   -- Wrap lines at 100 characters

-- Optional: configure list characters for viewing whitespace
-- Show invisible characters (like spaces and tabs)
opt.list = true
-- Define how invisible characters are displayed
opt.listchars:append "space:⋅" -- Shows a middle dot for spaces
opt.listchars:append "tab:▸ " -- Shows a right-pointing triangle for tabs followed by a space
opt.listchars:append "eol:↴" -- Shows a curved arrow for end-of-line (optional but useful)
opt.listchars:append "lead: " -- Leader character for wraps (important for correctly showing blankline indent)
opt.listchars:append "trail:·" -- Trailing spaces (optional)
