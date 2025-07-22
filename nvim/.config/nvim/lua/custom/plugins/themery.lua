-- NOTE: to disable themery (Color scheme picker)
-- This is disabled in favor of Telescope-themes extension.
if true then
  return {}
end

return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      -- List all available colorschemes
      themes = vim.fn.getcompletion('', 'color'),

      -- Specify the colorschemes
      -- themes = { 'gruvbox-material', 'cyberdream', 'catppuccin', 'tokyonight', 'material', 'vscode' },

      livePreview = true, -- Apply theme while picking. Default to true.
    }
  end,
}
