-- NOTE: Disable in favor of Snacks.terminal
if true then
  return {}
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]], -- Standard mapping
      hide_numbers = true,
      shade_terminals = true,
      direction = 'float', -- Use a floating window
      autochdir = true,
      float_opts = {
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
        -- width = <value>,
        -- height = <value>,
        -- row = <value>,
        -- col = vim.o.columns,
        winblend = 3,
        title_pos = 'center', -- 'left' | 'center' | 'right'
      },
    }
  end,
}
