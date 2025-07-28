local opt = vim.o

return {
  'akinsho/bufferline.nvim',
  -- enabled = false,
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    opt.termguicolors = true
    require('bufferline').setup {
      options = {
        styling = 'padded_slop',
        diagnostics = 'nvim_lsp',
        indicator = {
          -- style = 'underline',
        },
        hover = {
          enabled = true,
        },
      },
    }
  end,
}
