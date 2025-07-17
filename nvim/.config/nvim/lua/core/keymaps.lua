-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- =============================================================================
-- GENERAL & WINDOW MANAGEMENT
-- =============================================================================
-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- =============================================================================
-- PLUGIN KEYMAPS
-- =============================================================================

-- Nvim-Tree (File Explorer)
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- ToggleTerm (Terminal)
map("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle floating terminal" })

-- Dropbar.nvim
-- local dropbar_api = require('dropbar.api')
-- vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
-- vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
-- vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

-- =============================================================================
-- LSP KEYMAPS (NATIVE LSP)
-- =============================================================================
-- LSP navigation and information
map('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
map('n', 'gy', vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
map('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
-- map('n', 'gr', require('telescope.builtin').lsp_references, { desc = "Show References" })
map('n', 'K', vim.lsp.buf.hover, { desc = "Show Documentation" })

-- Renaming and diagnostics
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename Symbol" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- =============================================================================
-- NVIM-POSSESSION
-- =============================================================================

-- map('n', "<leader>sl", function() require("nvim-possession").list() end, { desc = "📌list sessions" })
-- map('n', "<leader>sn", function() require("nvim-possession").new() end, { desc = "📌create new session" })
-- map('n', "<leader>su", function() require("nvim-possession").update() end, { desc = "📌update current session", })
-- map('n', "<leader>sd", function() require("nvim-possession").delete() end, { desc = "📌delete selected session" })

-- =============================================================================
-- NVIM NOTIFY KEYMAPS
-- =============================================================================

map("n", "<leader>nh", "<cmd>Telescope notify<cr>", { desc = "View Notifications History" })

map("n", "<leader>nc", function()
    require("notify").clear()
end, { desc = "Clear all notifications" })

-- map("n", "<leader>nhc", function()
-- 	require("notify").clear_history()
-- end, { desc = "Clear notification history" })
