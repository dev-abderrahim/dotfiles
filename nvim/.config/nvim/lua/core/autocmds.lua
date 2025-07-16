-- ~/.config/nvim/lua/core/autocmds.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight the line your cursor is on
-- autocmd('CursorHold', {
--     pattern = '*',
--     command = 'set cursorline',
-- })
-- autocmd('CursorMoved', {
-- 	pattern = '*',
-- 	command = 'set nocursorline',
-- })
